package org.food.service;

import java.util.Date;

import javax.inject.Inject;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;
import org.food.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	@Override
	public void insertMember(MemberVO vo) {

		dao.insertMember(vo);
	}
	@Override
	public String checkId(String c_id) {
		// TODO Auto-generated method stub
		return dao.checkId(c_id);
	}
	@Override
	public String checkKakao(String k_id) {
		// TODO Auto-generated method stub
		return dao.checkKakao(k_id);
	}
	@Override
	public void insertKakaoMember(MemberVO vo) {
		dao.insertKakaoMember(vo);
	}
	@Override
	public MemberVO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}
	@Override
	public void keepLogin(String c_id, String sessionId, Date next) {
		// TODO Auto-generated method stub
		dao.keepLogin(c_id, sessionId, next);
		
	}
	@Override
	public MemberVO checkUserWithSessionKey(String value) {
		// TODO Auto-generated method stub
		return dao.checkUserWithSessionKey(value);
				
	}

}
