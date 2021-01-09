package com.fridgeCare.fri.king.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FBVO {
	int n , category;
	Date writedate;
	String writer , title , body , isshow , sdate , scategory;
	public String getScategory() {
		return scategory;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat f = new SimpleDateFormat("yy/MM/dd HH:mm");
		sdate = f.format(writedate);
	}
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
		switch(category) {
		case 1:scategory = "건의사항";
		break;
		case 2:scategory = "재료추가요청";
		break;
		case 3:scategory = "문의사항";
		break;
		}
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
		setSdate();
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}
