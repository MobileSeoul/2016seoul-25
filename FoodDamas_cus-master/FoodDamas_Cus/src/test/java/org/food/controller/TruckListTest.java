package org.food.controller;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.food.domain.PositionVO;
import org.food.persistence.TruckDAO;
import org.food.service.TruckService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**.xml" })
public class TruckListTest {
	@Inject
	private TruckService dao;

	@Test
	public void distanceTest() {
		PositionVO vo = new PositionVO();
		vo.setLat(37.493488);
		vo.setLng(127.028148);
		vo.setPage(0);
		System.out.println(dao.orderByDistance(vo));
		System.out.println(dao.distanceLength(vo));
	}

	@Test
	public void gradeTest() {
		PositionVO vo = new PositionVO();
		vo.setLat(37.493488);
		vo.setLng(127.028148);
		vo.setPage(0);
		System.out.println(dao.orderByGrade(vo));
		System.out.println(dao.gradeLength(vo));
	}

	@Test
	public void reviewTest() {
		PositionVO vo = new PositionVO();
		vo.setLat(37.493488);
		vo.setLng(127.028148);
		vo.setPage(0);
		System.out.println(dao.orderByReview(vo));
		System.out.println(dao.reviewLength(vo));
	}

}