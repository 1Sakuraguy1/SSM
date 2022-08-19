package com.atmiao.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author GuoYang
 * @create 2022-08-12 8:31
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class MapperTest {

//    @Autowired
//    DepartmentMapper departmentMapper;
//
//    @Autowired
//    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){

//        ApplicationContext ioc = new ClassPathXmlApplicationContext("spring.xml");
//        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);

//        System.out.println(departmentMapper);

//        departmentMapper.insert(new Department(null, "开发部"));
//        departmentMapper.insert(new Department(null, "测试部"));

        //2.插入员工信息
//        employeeMapper.insert(new Employee(null,"喵喵","w","miaomiao@qq.com",1));
//        employeeMapper.insert(new Employee(null,"崽崽","m","zaizai@qq.com",1));

//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String substring = UUID.randomUUID().toString().substring(0, 5)+i;
//            mapper.insertSelective(new Employee(null,substring,"w",substring+"@qq.com",1));
//        }
//        System.out.println("批量完成");
    }
}
