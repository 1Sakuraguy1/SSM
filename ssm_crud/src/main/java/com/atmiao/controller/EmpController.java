package com.atmiao.controller;

import com.atmiao.bean.Employee;
import com.atmiao.bean.Msg;
import com.atmiao.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GuoYang
 * @create 2022-08-11 11:44
 */
@Controller
public class EmpController {


    @Autowired
    private EmployeeService employeeService;

    /**
     * 实现单个或批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids") String ids ){
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String string : str_ids){
                del_ids.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();

    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp( @PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);

    }

    @ResponseBody
    @RequestMapping("/checkEmp")
    public Msg cheackEmp(@RequestParam("empName") String empName){
        //先判断用户名是否合法
        String regx =  "(^[a-zA_z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名不合法");
        }

        //数据库校验
        boolean isresult = employeeService.checkEmp(empName);
        if (isresult){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","用户名已存在");
        }
    }

    /** rest风格
     * 保存员工信息
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            //校验失败，返回失败
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors){
                System.out.println("错误字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail();
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getAllEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟着的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAllEmps();
        //获取分页包装的信息,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",pageInfo);

    }


//    @RequestMapping("/emps")
    public String getAlEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟着的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAllEmps();
        //获取分页包装的信息,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        return "page";
    }
}
