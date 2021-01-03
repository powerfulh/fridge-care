package com.fridgeCare.fri.juhyun.vo;

import java.sql.*;
import java.text.SimpleDateFormat;

import com.fridgeCare.fri.juhyun.PageUtil;

public class ResipiVO {
	private int bno,  bmno, mno, cnt, lcount, time, lcnt;
	private String id, title, video, bdate, ingred, body, dir, search;
	private char isshow;
	private Date wdate;
	private Time wtime;
	
	private PageUtil page;
	
	
	public int getLcnt() {
		return lcnt;
	}
	public void setLcnt(int lcnt) {
		this.lcnt = lcnt;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBmno() {
		return bmno;
	}
	public void setBmno(int bmno) {
		this.bmno = bmno;
	}
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
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
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
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getBdate() {
		return bdate;
	}
	public String getIngred() {
		return ingred;
	}
	public void setIngred(String ingred) {
		this.ingred = ingred;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public void setBdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yy/MM/dd ");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm");
		bdate = form1.format(wdate) + form2.format(wtime);
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public char getIsshow() {
		return isshow;
	}
	public void setIsshow(char isshow) {
		this.isshow = isshow;
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
		setBdate();
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	}
	
	
	
}
