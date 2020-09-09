package com.cdweb.entity;

public class Pagging {
	private long totalRecords;
	private int totalPages;
	private int indexPage;// current page
	private int recordPerPage = 10;
	private int offset; // 1-9,10-19

	public Pagging(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public long getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(long totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getTotalPages() {
		if(totalRecords> 0) {
			totalPages = (int) Math.ceil(totalRecords/(double)recordPerPage);
		}
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getIndexPage() {
		return indexPage;
	}

	public void setIndexPage(int indexPage) {
		this.indexPage = indexPage;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getOffset() {
		if(indexPage > 0) {
			
			offset = indexPage*recordPerPage - recordPerPage;//1*10 -10=0;2*10-10=10
		}
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

}
