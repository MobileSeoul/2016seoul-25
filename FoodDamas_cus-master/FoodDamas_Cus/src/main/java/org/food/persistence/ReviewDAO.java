package org.food.persistence;

import java.util.List;
import org.food.domain.ReviewVO;

public interface ReviewDAO {
	
	public List<String> readlist(ReviewVO vo) ;

	public Integer pageCount(String u_id) ;

	public void registerreview(ReviewVO vo) ; //업데이트
	
	public void reviewavg(ReviewVO vo) ; //인서트

}
