package com.egao.common.test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.egao.common.core.web.PageParam;
import com.egao.common.core.web.PageResult;
import com.egao.common.test.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * 服务类
 * Created by AutoGenerator on 2020-08-13 09:08:35
 */
public interface CourseService extends IService<Course> {

    /**
     * 分页查询
     */
    PageResult<Course> listPage(PageParam<Course> page);

    /**
     * 查询所有
     */
    List<Course> listAll(Map<String, Object> page);
    
    List<Course> listGgkc();
    
    List<Course> listZykc();
    
    List<Course> listMfkc();
    
    List<Course> listXie();

    List<Course> getByCourseIdVideo(Integer id);
}
