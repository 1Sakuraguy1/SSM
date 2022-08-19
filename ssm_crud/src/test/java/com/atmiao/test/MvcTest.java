package com.atmiao.test;

import com.atmiao.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import java.util.List;

/** 测试Crud请求的正确性
 * @author GuoYang
 * @create 2022-08-12 12:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:springmvc.xml"})
public class MvcTest {
    @Autowired
    WebApplicationContext context;
    //虚拟的mvc请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
       mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void test() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
        //请求成功以后，请求域中会有一个pageInfo：可以验证时候正确
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+pageInfo.getPageNum());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for (int i : navigatepageNums){
            System.out.println(" " + i);
        }

        List<Employee> list = pageInfo.getList();
        for(Employee employee: list){
            System.out.println("id:" + employee.getEmpId() + employee.getEmpName()  );
        }
    }

}
