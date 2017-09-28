package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.ApiVO;
import org.food.persistence.ApiDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class ApiServiceImpl implements ApiService {
	
	@Inject
	private ApiDAO dao;
	
	@Override
	public List<String> readlist(ApiVO vo) throws Exception {
		return dao.readlist(vo);

}
	
}
