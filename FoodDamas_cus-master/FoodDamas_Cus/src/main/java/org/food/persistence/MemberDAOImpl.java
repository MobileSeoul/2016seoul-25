package org.food.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public void insertMember(MemberVO vo) {
		sqlsession.insert("org.food.persistence.MemberMapper.insertMember", vo);
		

	}

	@Override
	public String checkId(String c_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.persistence.MemberMapper.checkId", c_id);

	}

	@Override
	public String checkKakao(String k_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.persistence.MemberMapper.checkKakao", k_id);
	}

	@Override
	public void insertKakaoMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlsession.insert("org.food.persistence.MemberMapper.insertKakaoMember", vo);

	}
	//·Î±×ÀÎ

	@Override
	public MemberVO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.persistence.MemberMapper.login", dto);
	}

	@Override
	public void keepLogin(String c_id, String sessionId, Date next) {
		
		Map<String , Object> paramMap=new HashMap<String ,Object>();
		paramMap.put("c_id", c_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		sqlsession.update("org.food.persistence.MemberMapper.keepLogin", paramMap);
		
	}

	@Override
	public MemberVO checkUserWithSessionKey(String value) {
		// TODO Auto-generated method stub
		
	    return sqlsession.selectOne("org.food.persistence.MemberMapper.checkUserWithSessionKey", value);
		
	}

}
