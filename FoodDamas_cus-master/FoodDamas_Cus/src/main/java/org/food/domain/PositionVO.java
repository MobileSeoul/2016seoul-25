package org.food.domain;

public class PositionVO {
	private double lat;
	private double lng;
	private Integer page;

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "PositionVO [lat=" + lat + ", lng=" + lng + ", page=" + page + "]";
	}

}
