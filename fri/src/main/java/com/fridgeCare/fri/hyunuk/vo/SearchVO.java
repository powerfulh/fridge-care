package com.fridgeCare.fri.hyunuk.vo;


import com.fridgeCare.fri.juhyun.PageUtil;

public class SearchVO {
	private int ino, lcount, bno, time, total;
	private String ingred, iname, iiname, category, tname, title, situat, id, search;
	@Override
	public String toString() {
		return "SearchVO [ino=" + ino + ", lcount=" + lcount + ", bno=" + bno + ", time=" + time + ", total=" + total
				+ ", ingred=" + ingred + ", iname=" + iname + ", iiname=" + iiname + ", category=" + category
				+ ", tname=" + tname + ", title=" + title + ", situat=" + situat + ", id=" + id + ", search=" + search
				+ ", page=" + page + "]";
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private PageUtil page;
	
	public String getIiname() {
		return iiname;
	}
	public void setIiname(String iiname) {
		this.iiname = iiname;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
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
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getIngred() {
		return ingred;
	}
	public void setIngred(String ingred) {
		this.ingred = ingred;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String gettname() {
		return tname;
	}
	public void settname(String tname) {
		this.tname = tname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSituat() {
		return situat;
	}
	public void setSituat(String situat) {
		this.situat = situat;
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	} 
	
}
