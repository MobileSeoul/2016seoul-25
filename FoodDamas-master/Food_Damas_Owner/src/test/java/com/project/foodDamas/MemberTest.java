package com.project.foodDamas;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.food.domain.MemberVO;
import com.food.services.Member.MemberService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberTest {

	@Inject
	private MemberService service;
	
	
	@Test
	public void registertest() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setU_id("aaaa");
		vo.setU_pw("aaa");
		vo.setU_name("aaaa");
		vo.setU_email("aaaa");
		vo.setU_phone("22222");
		vo.setCo_name("aaa");
		vo.setCo_num(1111);
		vo.setCo_doc("경로");
		vo.setU_profile_img("test");
		vo.setF_code(4);
		
		service.insert(vo);
	}
	
	@Test
	public void idcheck()throws Exception{
		System.out.println(service.idcheck("dd"));
	}

}
