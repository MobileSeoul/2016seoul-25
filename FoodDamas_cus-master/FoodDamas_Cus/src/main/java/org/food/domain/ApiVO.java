package org.food.domain;

public class ApiVO {
	
	private double lat;
	private double lng;
	private double relat;
	private double relng;
	private double distance;
	
	private String gu;
	private String dong;
	private int ju;
	private int bu;
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
	public double getRelat() {
		return relat;
	}
	public void setRelat(double relat) {
		this.relat = relat;
	}
	public double getRelng() {
		return relng;
	}
	public void setRelng(double relng) {
		this.relng = relng;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getJu() {
		return ju;
	}
	public void setJu(int ju) {
		this.ju = ju;
	}
	public int getBu() {
		return bu;
	}
	public void setBu(int bu) {
		this.bu = bu;
	}
	
	@Override
	public String toString() {
		return "ApiVO [lat=" + lat + ", lng=" + lng + ", relat=" + relat + ", relng=" + relng + ", distance=" + distance
				+ ", gu=" + gu + ", dong=" + dong + ", ju=" + ju + ", bu=" + bu + "]";
	}
	
}
