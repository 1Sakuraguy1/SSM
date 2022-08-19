package com.atmiao.service;

import com.atmiao.bean.Department;
import com.atmiao.bean.Msg;

import java.util.List;

/**
 * @author GuoYang
 * @create 2022-08-15 19:15
 */
public interface DepartmentService {


    //查询所有部门
    List<Department> getDepts();
}
