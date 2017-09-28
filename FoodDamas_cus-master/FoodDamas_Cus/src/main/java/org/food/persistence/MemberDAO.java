package org.food.persistence;

import org.food.domain.MemberVO;
import org.food.dto.LoginDTO;
import java.util.Date;

public interface MemberDAO {

	public void insertMember(MemberVO vo);

	public String checkId(String c_id);

	//īī���� ȸ����������
	public String checkKakao(String k_id);

	//īī���� ȸ������
	public void insertKakaoMember(MemberVO vo);

	//�α���
	public MemberVO login(LoginDTO dto);

	//�α��� ��Ű

	public void keepLogin(String c_id, String sessionId, Date next);

	public MemberVO checkUserWithSessionKey(String value);	





}
