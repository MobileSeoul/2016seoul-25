package com.food.persistences.Employee;

import java.util.HashMap;

import com.food.domain.EmployeeVO;

public interface EmployeeDAO {
	public EmployeeVO getLogin(HashMap<String,Object> map) throws Exception;
}
