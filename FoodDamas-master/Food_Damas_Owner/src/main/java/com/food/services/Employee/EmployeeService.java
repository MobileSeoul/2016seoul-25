package com.food.services.Employee;

import java.util.HashMap;

import com.food.domain.EmployeeVO;

public interface EmployeeService {
	public EmployeeVO getLogin(HashMap<String, Object> map) throws Exception;
}
