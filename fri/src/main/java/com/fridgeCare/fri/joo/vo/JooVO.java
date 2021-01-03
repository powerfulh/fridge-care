package com.fridgeCare.fri.joo.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class JooVO {
	private int bpno, bno, bmno, tno, time;
	private String id, title, category, video, situat, inbox;
	private String[] inboxList;
	private String[] body;
	private String[] fname;
	private MultipartFile[] image;
	
	
	public String[] getFname() {
		return fname;
	}
	public void setFname(String[] fname) {
		this.fname = fname;
	}
	public int getBpno() {
		return bpno;
	}
	public void setBpno(int bpno) {
		this.bpno = bpno;
	}
	public String[] getBody() {
		return body;
	}
	public void setBody(String[] body) {
		this.body = body;
	}
	public MultipartFile[] getImage() {
		return image;
	}
	public void setImage(MultipartFile[] image) {
		this.image = image;
	}
	public String getInbox() {
		return inbox;
	}
	public void setInbox(String inbox) {
		this.inbox = inbox;
	}
	public String[] getInboxList() {
		return inboxList;
	}
	public void setInboxList(String[] inboxList) {
		this.inboxList = inboxList;
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
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getSituat() {
		return situat;
	}
	public void setSituat(String situat) {
		this.situat = situat;
	}
	@Override
	public String toString() {
		return "JooVO [bpno=" + bpno + ", bno=" + bno + ", bmno=" + bmno + ", tno=" + tno + ", time=" + time
				+ ", title=" + title + ", category=" + category + ", video=" + video + ", situat=" + situat + ", inbox="
				+ inbox + ", inboxList=" + Arrays.toString(inboxList) + ", body=" + Arrays.toString(body) + ", image="
				+ Arrays.toString(image) + ", getBpno()=" + getBpno() + ", getBody()=" + Arrays.toString(getBody())
				+ ", getImage()=" + Arrays.toString(getImage()) + ", getInbox()=" + getInbox() + ", getInboxList()="
				+ Arrays.toString(getInboxList()) + ", getBno()=" + getBno() + ", getBmno()=" + getBmno()
				+ ", getTno()=" + getTno() + ", getTime()=" + getTime() + ", getTitle()=" + getTitle()
				+ ", getCategory()=" + getCategory() + ", getVideo()=" + getVideo() + ", getSituat()=" + getSituat()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
