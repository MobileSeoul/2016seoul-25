package com.food.services.Member;

import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import com.food.domain.MemberVO;
import com.food.dto.LoginDTO;
import com.food.persistences.Member.MemberDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	private SqlSessionTemplate sqlsession;
	
	//회원가입
	@Override
	public void insert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);		
	}

	//회원보기
	@Override
	public MemberVO view(String u_id) throws Exception {
		return dao.view(u_id);
	}
	

	@Override
	public String idcheck(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idcheck(u_id);
	}

	//회원수정
	@Override
	public void update(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);

	}

	//회원삭제
	@Override
	public void delete(String u_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(u_id);		
	}

	//승인대기자 리스트
	@Override
	public List<MemberVO> listState(Integer register_state) throws Exception {
		return sqlsession.selectList("com.food.persistences.MemberMapper.listState", register_state);
	}

	//페이지
	@Override
	public Integer pageCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.food.persistences.MemberMapper.pageCount");
	}

	//승인대기자 승인
	@Override
	public void updateState(MemberVO vo) throws Exception {
		sqlsession.update("com.food.persistences.MemberMapper.updateState", vo);
	}

	//�α��� _leeek
	private static  String namespace="com.food.persistences.MemberMapper";
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	public void keepLogin (String u_id, String sessionId, Date next){

		dao.keepLogin(u_id, sessionId, next);
	}


	@Override
	public MemberVO checkLoginBefore(String value) {
		// TODO Auto-generated method stub
		return dao.checkUserWithSessionKey(value);
	}


}
