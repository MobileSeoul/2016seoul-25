package com.food.services.Employee;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.EmployeeVO;
import com.food.persistences.Employee.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Inject
	private EmployeeDAO employeeDAO;
	
	@Override
	public EmployeeVO getLogin(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return employeeDAO.getLogin(map);
	}
	
}
