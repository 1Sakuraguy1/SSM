package com.atmiao.service;

import com.atmiao.bean.Employee;

import java.util.List;

/**
 * @author GuoYang
 * @create 2022-08-12 11:48
 */
public interface EmployeeService {

    /**
     *  查询所有员工
     * @return
     */
    List<Employee> getAllEmps();

    void saveEmp(Employee employee);

    /**
     * 通过用户名查询用户的数量
     * @param empName
     * @return
     */
    boolean checkEmp(String empName);


    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteEmp(Integer id);

    void deleteBatch(List<Integer> del_ids);
}
