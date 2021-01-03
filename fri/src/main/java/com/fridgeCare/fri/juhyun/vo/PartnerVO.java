package com.fridgeCare.fri.juhyun.vo;

import java.util.*;
import java.text.SimpleDateFormat;

public class PartnerVO { 
	private int cnt, lcount, bno;
	private String id, title, bdate, bdir, mdir;
	private Date wdate;
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLcount() {
		return lcount;
	}
	public void setLcount(int lcount) {
		this.lcount = lcount;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yy/MM/dd HH:mm");
		bdate = form1.format(wdate);
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBdir() {
		return bdir;
	}
	public void setBdir(String bdir) {
		this.bdir = bdir;
	}
	public String getMdir() {
		return mdir;
	}
	public void setMdir(String mdir) {
		this.mdir = mdir;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setBdate();
	}
	
	
}
