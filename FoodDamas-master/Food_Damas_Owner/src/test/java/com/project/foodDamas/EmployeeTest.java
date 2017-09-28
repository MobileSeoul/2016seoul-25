package com.project.foodDamas;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.food.domain.EmployeeVO;
import com.food.persistences.Employee.EmployeeDAO;
import com.food.services.Employee.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class EmployeeTest {
	@Inject
	private EmployeeService service;
	
	@Test
	public void testLogin() throws Exception{
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("emp_pass", "21232f297a57a5a743894a0e4a801fc3");
		map.put("emp_user", "admin");
		
		System.out.println(map);
		EmployeeVO vo = service.getLogin(map);
		/*EmployeeVO vo = empService.getLogin(map);
		System.out.println(vo.getEmp_user());
		System.out.println(vo.getEmp_pass());*/
	}
}
