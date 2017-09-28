package com.food.persistences.Member;

import java.util.Date;
import java.util.List;
import com.food.domain.MemberVO;
import com.food.dto.LoginDTO;

public interface MemberDAO {

	public void insert(MemberVO vo) throws Exception;
	
	public MemberVO view(String u_id) throws Exception;
	
	public String idcheck(String u_id)throws Exception;//중복체크
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(String u_id) throws Exception;
	
	public List<MemberVO> listState(Integer register_state) throws Exception;
	
	public void updateState(MemberVO vo) throws Exception;
	
	public Integer pageCount() throws Exception;	
	//�α��κκ�
	public MemberVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String u_id, String sessionId, Date next);
	
	public MemberVO checkUserWithSessionKey(String value);

}
