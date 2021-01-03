package com.fridgeCare.fri.joo.vo;

import org.springframework.web.multipart.MultipartFile;

public class JTumbVO {
	private int tno, tmno;
	private String dir, tname, id;
	private MultipartFile thumb;
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public MultipartFile getThumb() {
		return thumb;
	}
	public void setThumb(MultipartFile thumb) {
		this.thumb = thumb;
	}
	public int getTnom() {
		return tno;
	}
	public void setTnom(int tnom) {
		this.tno = tnom;
	}
	public int getTmno() {
		return tmno;
	}
	public void setTmno(int tmno) {
		this.tmno = tmno;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
