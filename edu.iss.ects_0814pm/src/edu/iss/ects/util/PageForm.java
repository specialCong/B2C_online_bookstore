package edu.iss.ects.util;

import org.apache.struts.action.ActionForm;

public class PageForm extends ActionForm {
	
	//当前页数
	private int currentPageNo;

	//要跳转到的页数
	private int toPageNo;

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public int getToPageNo() {
		return toPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public void setToPageNo(int toPageNo) {
		this.toPageNo = toPageNo;
	}
}
