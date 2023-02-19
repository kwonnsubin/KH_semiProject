package kh.board.model.vo;

import java.sql.Timestamp;

import oracle.sql.DATE;

public class BoardVo {
// 게시판 테이블
//	BOARD_NO NOT NULL NUMBER         
//	WRITER            VARCHAR2(20)   
//	PWD               VARCHAR2(20)   
//	TITLE    NOT NULL VARCHAR2(200)  
//	CONTENT  NOT NULL VARCHAR2(4000) 
//	REGDATE           TIMESTAMP(6)   
//	CATEGORY          NUMBER 
	

// 댓글 테이블
//	BOARD_NO      NOT NULL NUMBER         
//	REPLY_NO               NUMBER         
//	REPLY_WRITER  NOT NULL VARCHAR2(20)   
//	REPLY_REGDATE          TIMESTAMP(6)   
//	REPLY_CONTENT NOT NULL VARCHAR2(4000) 
//	REPLY_PWD     NOT NULL VARCHAR2(20)
	
	int board_no; // 꼭 소문자로써...
	String writer;
	String pwd;
	String title;
	String content;
	Timestamp regdate;
	int category;
	
	int reply_no;
	String reply_writer;
	Timestamp reply_regdate;
	String reply_content;
	String reply_pwd;
	
	
	
	@Override
	public String toString() {
		return "BoardVo [board_no=" + board_no + ", writer=" + writer + ", pwd=" + pwd + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", category=" + category + ", reply_no=" + reply_no
				+ ", reply_writer=" + reply_writer + ", reply_regdate=" + reply_regdate + ", reply_content="
				+ reply_content + ", reply_pwd=" + reply_pwd + "]";
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public Timestamp getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Timestamp reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_pwd() {
		return reply_pwd;
	}
	public void setReply_pwd(String reply_pwd) {
		this.reply_pwd = reply_pwd;
	}
	
	
	
}
