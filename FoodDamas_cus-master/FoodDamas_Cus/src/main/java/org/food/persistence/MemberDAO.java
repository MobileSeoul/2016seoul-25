package org.food.persistence;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;
import java.util.Date;

public interface MemberDAO {

	public void insertMember(MemberVO vo);

	public String checkId(String c_id);

	//카카오톡 회원가입유무
	public String checkKakao(String k_id);

	//카카오톡 회원가입
	public void insertKakaoMember(MemberVO vo);

	//로그인
	public MemberVO login(LoginDTO dto);

	//로그인 쿠키

	public void keepLogin(String c_id, String sessionId, Date next);

	public MemberVO checkUserWithSessionKey(String value);	





}
