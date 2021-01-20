package com.fridgeCare.fri.hh.util;

import java.util.ArrayList;

public class Hoonpage {
	int totalcontent , maxcontent , pagecount , presentpage , selectablepage , maxselectablepage;
	ArrayList<Integer> block;
	public Hoonpage(int howmanycontent , int howmanycontain , int howmanypage , int whatpagenow) {
		totalcontent = howmanycontent;
		maxcontent = howmanycontain;
		maxselectablepage = howmanypage;
		presentpage = whatpagenow;
		if(totalcontent%maxcontent == 0) {
			pagecount = totalcontent/maxcontent;
		}else {
			pagecount = totalcontent/maxcontent + 1;
		}
		if(maxselectablepage > pagecount) {
			selectablepage = pagecount;
		}else {
			selectablepage = maxselectablepage;
		}
	}
	public int Pageset(int whatpagenow) {
		int content = (whatpagenow-1)*maxcontent;
		return content; 
	}
	public int Pageset() {
		int content = (presentpage-1)*maxcontent;
		return content; 
	}
	public ArrayList<Integer> getoddfixblock() {
		block = new ArrayList<Integer>();
		int[] array = new int[maxselectablepage];
		int middle = (maxselectablepage-1)/2;
		array[middle] = presentpage;
		for(int i = 0; i < middle; i++) {
			array[middle+1+i] = presentpage+1+i;
			array[middle-1-i] = presentpage-1-i;
		}
		for(int i = 0; i < array.length; i++) {
			if(array[i] > 0 && array[i] <= pagecount) {
				block.add(array[i]);
			}
		}
		return block;
	}
	public int getTotalcontent() {
		return totalcontent;
	}
	public int getMaxcontent() {
		return maxcontent;
	}
	public int getPagecount() {
		return pagecount;
	}
	public int getPresentpage() {
		return presentpage;
	}
	public int getSelectablepage() {
		return selectablepage;
	}
	public int getMaxselectablepage() {
		return maxselectablepage;
	}
}
