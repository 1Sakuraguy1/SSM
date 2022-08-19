package com.atmiao.service.impl;

import com.atmiao.bean.Employee;
import com.atmiao.bean.EmployeeExample;
import com.atmiao.mapper.EmployeeMapper;
import com.atmiao.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

;import java.util.List;

/**
 * @author GuoYang
 * @create 2022-08-12 11:48
 */
@Service
public class EmployeeServiceImmpl implements EmployeeService {
   @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAllEmps() {
        return  employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkEmp(String empName) {
        EmployeeExample example  = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        System.out.println(count);
        return count==0;
    }

    @Override
    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
