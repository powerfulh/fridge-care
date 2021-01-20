package com.fridgeCare.fri.king.vo;

public class PageVO {
	int firstcontent , lastcontent;

	public int getFirstcontent() {
		return firstcontent;
	}

	public void setFirstcontent(int firstcontent) {
		this.firstcontent = firstcontent;
	}

	public int getLastcontent() {
		return lastcontent;
	}

	public void setLastcontent(int maxcontent) {
		lastcontent = firstcontent + maxcontent;
		firstcontent++;
	}
}
