package org.food.service;

import java.util.Date;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;

public interface MemberService {
	public void insertMember(MemberVO vo);
	
	public String checkId(String c_id);
	
	//īī���� ȸ������ ����Ȯ��
	public String checkKakao(String k_id);
	//īī���� ȸ������
	public void insertKakaoMember(MemberVO vo);

	//�α���
	public MemberVO login(LoginDTO dto);

	public void keepLogin(String c_id, String sessionId, Date next);
	public MemberVO checkUserWithSessionKey(String value);	


}
