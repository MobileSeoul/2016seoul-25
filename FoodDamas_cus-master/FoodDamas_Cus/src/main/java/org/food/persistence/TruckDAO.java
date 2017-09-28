package org.food.persistence;

import java.util.List;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;
import org.springframework.stereotype.Repository;

public interface TruckDAO {
	public List<Object> orderByDistance(PositionVO vo);

	public Integer distanceLength(PositionVO vo);

	public List<Object> orderByGrade(PositionVO vo);

	public Integer gradeLength(PositionVO vo);

	public List<Object> orderByReview(PositionVO vo);

	public Integer reviewLength(PositionVO vo);
}
