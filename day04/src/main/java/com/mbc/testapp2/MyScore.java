package com.mbc.testapp2;

public class MyScore {
	private int kor;
	private int eng;
	private int math;
	
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	public int getTotal() {
		return kor + eng + math;
	}
	
	public String getAvg() {
		double avg = (kor + eng + math)/3.0;
		String strAvg = String.format("%.2f", avg);
		return strAvg;
	}
	
	
}
