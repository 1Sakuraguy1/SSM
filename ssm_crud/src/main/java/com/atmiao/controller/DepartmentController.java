package com.atmiao.controller;

import com.atmiao.bean.Department;
import com.atmiao.bean.Msg;
import com.atmiao.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author GuoYang
 * @create 2022-08-15 19:13
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;


    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDeptt(){
        List<Department> list= departmentService.getDepts();
        return Msg.success().add("departments",list);

    }
}
