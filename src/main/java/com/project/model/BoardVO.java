package com.project.model;

public class BoardVO {

	/*
	 * bno number generated always as IDENTITY, title varchar2(150) not null,
	 * content varchar2(2000) not null, writer varchar2(50) not null, regdate date
	 * default sysdate, updatedate date default sysdate
	 */

	private String bbsTyp;
	private int bbsNo;
	private String bbsTitle;
	private String bbsContent;
	private String docId;
	private String bbsInsDte;
	private String bbsLstDte;
	private String userId;
	private String delYn;

	public String getBbsTyp() {
		return bbsTyp;
	}

	public void setBbsTyp(String bbsTyp) {
		this.bbsTyp = bbsTyp;
	}

	public int getBbsNo() {
		return bbsNo;
	}

	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getBbsInsDte() {
		return bbsInsDte;
	}

	public void setBbsInsDte(String bbsInsDte) {
		this.bbsInsDte = bbsInsDte;
	}

	public String getBbsLstDte() {
		return bbsLstDte;
	}

	public void setBbsLstDte(String bbsLstDte) {
		this.bbsLstDte = bbsLstDte;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "BoardVO [bbsTyp=" + bbsTyp + ", bbsNo=" + bbsNo + ", bbsTitle=" + bbsTitle + ", bbsContent="
				+ bbsContent + ", docId=" + docId + ", bbsInsDte=" + bbsInsDte + ", bbsLstDte=" + bbsLstDte
				+ ", userId=" + userId + ", delYn=" + delYn + "]";
	}

//	/* 게시판 번호 */
//	private int bno;
//	
//	/* 게시판 제목 */
//	private String title;
//	
//	/* 게시판 내용 */
//	private String content;
//	
//	/* 게시판 작가 */
//	private String writer;
//	
//	/* 등록 날짜 */
//	private Date regdate;
//	
//	/* 수정 날짜 */
//	private Date updateDate;
//
//	public int getBno() {
//		return bno;
//	}
//
//	public void setBno(int bno) {
//		this.bno = bno;
//	}
//
//	public String getTitle() {
//		return title;
//	}
//
//	public void setTitle(String title) {
//		this.title = title;
//	}
//
//	public String getContent() {
//		return content;
//	}
//
//	public void setContent(String content) {
//		this.content = content;
//	}
//
//	public String getWriter() {
//		return writer;
//	}
//
//	public void setWriter(String writer) {
//		this.writer = writer;
//	}
//
//	public Date getRegdate() {
//		return regdate;
//	}
//
//	public void setRegdate(Date regdate) {
//		this.regdate = regdate;
//	}
//
//	public Date getUpdateDate() {
//		return updateDate;
//	}
//
//	public void setUpdateDate(Date updateDate) {
//		this.updateDate = updateDate;
//	}
//
//	@Override
//	public String toString() {
//		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
//				+ regdate + ", updateDate=" + updateDate + "]";
//	}

}
