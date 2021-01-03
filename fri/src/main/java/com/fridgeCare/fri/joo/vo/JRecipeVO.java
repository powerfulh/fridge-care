package com.fridgeCare.fri.joo.vo;

import org.springframework.web.multipart.MultipartFile;

public class JRecipeVO {
	private int bpno, bno;
	private String body, oriname, savename, dir;
	private String[] fname;
	private MultipartFile[] image;
	
	public MultipartFile[] getImage() {
		return image;
	}
	public void setImage(MultipartFile[] image) {
		this.image = image;
	}
	public int getBpno() {
		return bpno;
	}
	public void setBpno(int bpno) {
		this.bpno = bpno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savaname) {
		this.savename = savaname;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String[] getFname() {
		return fname;
	}
	public void setFname(String[] fname) {
		this.fname = fname;
	}
	
}
