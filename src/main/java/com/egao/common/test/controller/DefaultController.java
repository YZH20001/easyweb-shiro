package com.egao.common.test.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.egao.common.core.shiro.CustomizedToken;
import com.egao.common.core.utils.FileUploadUtil;
import com.egao.common.core.web.JsonResult;
import com.egao.common.core.web.PageParam;
import com.egao.common.core.web.PageResult;
import com.egao.common.system.entity.UserTwo;
import com.egao.common.system.service.UserTwoService;
import com.egao.common.test.entity.Classify;
import com.egao.common.test.entity.Course;
import com.egao.common.test.entity.Order;
import com.egao.common.test.entity.Present;
import com.egao.common.test.entity.Release;
import com.egao.common.test.entity.Teacher;
import com.egao.common.test.entity.Video;
import com.egao.common.test.service.ClassifyService;
import com.egao.common.test.service.CourseService;
import com.egao.common.test.service.LunboService;
import com.egao.common.test.service.MenurService;
import com.egao.common.test.service.OrderService;
import com.egao.common.test.service.PresentService;
import com.egao.common.test.service.ReleaseService;
import com.egao.common.test.service.TeacherService;
import com.egao.common.test.service.VideoService;
import com.wf.captcha.utils.CaptchaUtil;

@Controller
@RequestMapping("/default")
public class DefaultController {
	
	@Autowired
	private MenurService menurService;
	@Autowired
	private LunboService lunboService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private ClassifyService classifyService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PresentService presentService;
	@Autowired
	private ReleaseService releaseService;
	@Autowired
	private UserTwoService usertwoService;
	
	@RequestMapping("/default")
    public String index(Model model) {
//		Subject subject = SecurityUtils.getSubject();
//        Object object = subject.getPrincipal();
//        if(object != null) {
//        	model.addAttribute("user", (UserTwo)object);
//        }
		model.addAttribute("menu", menurService.list());
		model.addAttribute("lunbo", lunboService.list());
		model.addAttribute("ggkc", courseService.listGgkc());
		model.addAttribute("zykc", courseService.listZykc());
		model.addAttribute("mfkc", courseService.listMfkc());
        return "default/default.html";
    }
	
	@RequestMapping("/course")
    public String course(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		model.addAttribute("menu", menurService.list());
		model.addAttribute("classify", classifyService.list());
        return "default/course.html";
    }
	
	@RequestMapping("/present")
    public String present(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		model.addAttribute("menu", menurService.list());
		model.addAttribute("present", presentService.list());
		model.addAttribute("lunbo", lunboService.list());
        return "default/present.html";
    }
	
    @ResponseBody
    @PostMapping("/upload")
    public JsonResult upload(@RequestParam MultipartFile file) {
        return FileUploadUtil.upload(file);
    }
    
    @ResponseBody
    @PostMapping("/edit_upload")
    public JsonResult edit_upload(@RequestParam MultipartFile file) {
        return FileUploadUtil.edit_upload(file);
    }
	
	@RequestMapping("/detail/{id}/")
	public String detail(@PathVariable("id") Integer id,Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	Order order = orderService.getOne(new QueryWrapper<Order>().eq("course_id", id).eq("user_id", ((UserTwo)object).getUserId()));
        	if(order != null) {
        		model.addAttribute("order",order);
        	}else {
        		model.addAttribute("order",null);
        	}
        	model.addAttribute("user", (UserTwo)object);
        }else {
        	model.addAttribute("order",null);
        }
		Course course = courseService.getById(id);
		Teacher teacher = teacherService.getById(course.getTeacherId());
		Classify classify = classifyService.getById(course.getClassifyId());
		model.addAttribute("course", course);
		model.addAttribute("teacher", teacher);
		model.addAttribute("classify", classify);
		model.addAttribute("videos", videoService.list(new QueryWrapper<Video>().eq("course_id", course.getId())));
		model.addAttribute("menu", menurService.list());
		model.addAttribute("tuijian", courseService.listXie());
		return "default/detail.html";
	}
	
	@RequestMapping("/detail2/{id}/")
	public String detail2(@PathVariable("id") Integer id,Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		Release release = releaseService.getById(id);
		UserTwo user = usertwoService.getById(release.getUserId());
		model.addAttribute("release", release);
		model.addAttribute("user", user);
		model.addAttribute("menu", menurService.list());
		model.addAttribute("tuijian", courseService.listXie());
		return "default/detail2.html";
	}
	
	@RequestMapping("/pay/{id}/")
	public String pay(@PathVariable("id") Integer id,Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		Course course = courseService.getById(id);
		model.addAttribute("course", course);
		model.addAttribute("menu", menurService.list());
		return "default/pay.html";
	}
	
	@RequestMapping("/release")
	public String release(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		model.addAttribute("menu", menurService.list());
		return "default/release.html";
	}
	
	@RequestMapping("/releases")
	public String releases(Model model) {
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if(object != null) {
        	model.addAttribute("user", (UserTwo)object);
        }
		model.addAttribute("menu", menurService.list());
		model.addAttribute("lunbo", lunboService.list());
		return "default/releases.html";
	}
	
	/**
     * ????????????
     */
    @ResponseBody
    @RequestMapping("/course/page")
    public PageResult<Course> page(HttpServletRequest request) {
        PageParam<Course> pageParam = new PageParam<>(request);
        return new PageResult<>(courseService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }
    
    /**
     * ????????????
     */
    @ResponseBody
    @RequestMapping("/present/page")
    public PageResult<Present> pages(HttpServletRequest request) {
        PageParam<Present> pageParam = new PageParam<>(request);
        return new PageResult<>(presentService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }
    
    /**
     * ????????????
     */
    @ResponseBody
    @RequestMapping("/release/page")
    public PageResult<Release> pagess(HttpServletRequest request) {
        PageParam<Release> pageParam = new PageParam<>(request);
        return new PageResult<>(releaseService.page(pageParam, pageParam.getWrapper()).getRecords(), pageParam.getTotal());
    }
    
    @PostMapping("/pay")
    @ResponseBody
    public JsonResult pays(String type,String name,String jine) {
    	Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if (object != null) {
        	String orderNo = "COURSE" + (int)((Math.random()*9+1)*100000);
        	Order order = new Order();
        	order.setCreateTime(new Date());
        	order.setJine(jine);
        	order.setName(name);
        	order.setOrderNo(orderNo);
        	order.setType(type);
        	order.setUserId(((UserTwo)object).getUserId());
        	Boolean res = orderService.save(order);
        	if(res) {
        		return JsonResult.ok("????????????");
        	}else {
        		return JsonResult.error("????????????");
        	}
        } else {
        	return JsonResult.error("????????????");
        }
    }
    
    @PostMapping("/releaseSave")
    @ResponseBody
    public JsonResult releaseSave(String name,String content,String url,String image) {
    	Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if (object != null) {
        	Release releae = new Release();
        	releae.setCreateTime(new Date());
        	releae.setContent(content);
        	releae.setName(name);
        	releae.setState(0);
        	releae.setUrl(url);
        	releae.setImage(image);
        	releae.setUserId(((UserTwo)object).getUserId());
        	Boolean res = releaseService.save(releae);
        	if(res) {
        		return JsonResult.ok("????????????");
        	}else {
        		return JsonResult.error("????????????");
        	}
        } else {
        	return JsonResult.error("????????????");
        }
    }
    
    /**
     * ??????
     */
	@RequestMapping("/login")
    public String login(Model model) {
		
		Subject subject = SecurityUtils.getSubject();
        Object object = subject.getPrincipal();
        if (object != null) {
        	model.addAttribute("menu", menurService.list());
        	model.addAttribute("user", (UserTwo)object);
        	return "redirect:/users/index";
        }else {
        	UserTwo user2 = new UserTwo();
			user2.setUsername("??????");
			user2.setUserId(-1);
			model.addAttribute("user", user2);
			model.addAttribute("menu", menurService.list());
			return "default/login.html";
		}
		
        
    }

	/**
     * ????????????
     */
    @ResponseBody
    @PostMapping("/tologin")
    public JsonResult tologin(String username, String password, String code, Boolean remember, HttpServletRequest request) {
        if (username == null || username.trim().isEmpty()) return JsonResult.error("???????????????");
        if (!CaptchaUtil.ver(code, request)) {
            return JsonResult.error("??????????????????");
        }
        try {
            if (remember == null) remember = false;
            SecurityUtils.getSubject().login(new CustomizedToken(username, password, remember,"User"));
            return JsonResult.ok("????????????").put("action", "/users/index").put("status", 0);
        } catch (IncorrectCredentialsException ice) {
            return JsonResult.error("????????????");
        } catch (UnknownAccountException uae) {
            return JsonResult.error("???????????????");
        } catch (LockedAccountException e) {
            return JsonResult.error("???????????????");
        } catch (ExcessiveAttemptsException eae) {
            return JsonResult.error("??????????????????????????????");
        }
    }
    
    @RequestMapping(value = "/logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/default/login";
    }
}
