package com.fridgeCare.fri.juhyun.vo;

import java.sql.*;
import java.text.SimpleDateFormat;

public class AdminVO {
	private int bcnt, bno, mno, tno, cno, cnt;
	private String id , mail, condate, joindate, body, cdate, isshow, title;
	private Date cedate, jdate, wdate;
	private Time cetime, jtime, wtime;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCondate() {
		return condate;
	}
	public void setCondate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm");
		condate = form1.format(cedate) + " " + form2.format(cetime);
	}
	public void setCondate(String condate) {
		this.condate = condate;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm");
		cdate = form1.format(wdate) + " " + form2.format(wtime);
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public Time getWtime() {
		return wtime;
	}
	public void setWtime(Time wtime) {
		this.wtime = wtime;
		setCdate();
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm");
		joindate = form1.format(jdate) + " " + form2.format(jtime);
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public Date getCedate() {
		return cedate;
	}
	public void setCedate(Date cedate) {
		this.cedate = cedate;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public Time getCetime() {
		return cetime;
	}
	public void setCetime(Time cetime) {
		this.cetime = cetime;
		setCondate();
	}
	public Time getJtime() {
		return jtime;
	}
	public void setJtime(Time jtime) {
		this.jtime = jtime;
		setJoindate();
	}
	
	
}
