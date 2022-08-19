package com.atmiao.service.impl;

import com.atmiao.bean.Department;
import com.atmiao.bean.Msg;
import com.atmiao.mapper.DepartmentMapper;
import com.atmiao.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author GuoYang
 * @create 2022-08-15 19:15
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepts() {
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }


}
