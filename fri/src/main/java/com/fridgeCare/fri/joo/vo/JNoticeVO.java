package com.fridgeCare.fri.joo.vo;

import java.text.SimpleDateFormat;

import java.util.*;

public class JNoticeVO {
	private int nno, ncode, nupno, nclick;
	private String ntitle, nbody, nisshow, sdate, subbody;
	private Date ndate;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getNcode() {
		return ncode;
	}
	public void setNcode(int ncode) {
		this.ncode = ncode;
	}
	public int getNupno() {
		return nupno;
	}
	public void setNupno(int nupno) {
		this.nupno = nupno;
	}
	public int getNclick() {
		return nclick;
	}
	public void setNclick(int nclick) {
		this.nclick = nclick;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNbody() {
		return nbody;
	}
	public void setNbody(String nbody) {
		this.nbody = nbody;
	}
	public String getNisshow() {
		return nisshow;
	}
	public void setNisshow(String nisshow) {
		this.nisshow = nisshow;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		sdate = form.format(ndate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getSubbody() {
		return subbody;
	}
	public void setSubbody(String subbody) {
		this.subbody = subbody;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
		setSdate();
	}
	
	
	
}
