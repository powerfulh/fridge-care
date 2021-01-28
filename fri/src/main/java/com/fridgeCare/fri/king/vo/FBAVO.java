package com.fridgeCare.fri.king.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FBAVO {
	int n , upno;
	String body , isshow , sdate;
	Date writedate;
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat f = new SimpleDateFormat("yy/MM/dd HH:mm");
		sdate = f.format(writedate);
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
		setSdate();
	}
	public Date getWritedate() {
		return writedate;
	}
}
