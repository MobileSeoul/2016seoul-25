package com.food.persistences.Member;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.food.domain.MemberVO;
import com.food.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	//�쉶�썝媛��엯
	@Override
	public void insert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("com.food.persistences.MemberMapper.insert", vo);
	}

	//회원정보보기
	@Override
	public MemberVO view(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.food.persistences.MemberMapper.view", u_id);
	}

	@Override
	public String idcheck(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.food.persistences.MemberMapper.idcheck",u_id);
	}

	//�쉶�썝�닔�젙
	@Override
	public void update(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update("com.food.persistences.MemberMapper.update", vo);
	}

	//�쉶�썝�궘�젣
	@Override
	public void delete(String u_id) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete("com.food.persistences.MemberMapper.delete", u_id);
		
	}

	//�듅�씤��湲곗옄 由ъ뒪�듃
	@Override
	public List<MemberVO> listState(Integer register_state) throws Exception {
		return sqlsession.selectList("com.food.persistences.MemberMapper.listState", register_state);
	}

	//�럹�씠吏�
	@Override
	public Integer pageCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.food.persistences.MemberMapper.pageCount");
	}

	//�듅�씤��湲곗옄 �듅�씤
	@Override
	public void updateState(MemberVO vo) throws Exception {
		sqlsession.update("com.food.persistences.MemberMapper.updateState", vo);
	}
	
	//로그인_leeek
	
	private static  String namespace="com.food.persistences.MemberMapper";
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login", dto);
	}

	@Override
	public void keepLogin(String u_id, String sessionId, Date next) {
		
		Map<String , Object> paramMap=new HashMap<String ,Object>();
		paramMap.put("u_id", u_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		sqlsession.update(namespace+".keepLogin", paramMap);
		
	}

	@Override
	public MemberVO checkUserWithSessionKey(String value) {
		// TODO Auto-generated method stub
		
	    return sqlsession.selectOne(namespace +".checkUserWithSessionKey", value);
		
	}

	
}
