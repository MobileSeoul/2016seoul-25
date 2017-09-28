package org.food.service;

import java.util.Date;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;

public interface MemberService {
	public void insertMember(MemberVO vo);
	
	public String checkId(String c_id);
	
	//카카오톡 회원가입 유무확인
	public String checkKakao(String k_id);
	//카카오톡 회원가입
	public void insertKakaoMember(MemberVO vo);

	//로그인
	public MemberVO login(LoginDTO dto);

	public void keepLogin(String c_id, String sessionId, Date next);
	public MemberVO checkUserWithSessionKey(String value);	


}
