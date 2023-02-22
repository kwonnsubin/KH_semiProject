package kh.recycle.model.vo;

public class RecycleVo {
	
//	재활용
//	RECYCLE_CODE  NOT NULL NUMBER         
//	RECYCLE_NAME  NOT NULL VARCHAR2(20)   
//	RECYCLE_TAG            VARCHAR2(300)  
//	RECYCLE_CHECK          VARCHAR2(10)   
//	CONTENT                VARCHAR2(4000) 
	
	
//	재활용분류번호 테이블
//	RECYCLE_CODE          NUMBER 
//	CF_CODE      NOT NULL NUMBER 
	
	
// (대형생활폐기물, 의류수거함, 일반쓰레기)
//	CF_CODE NOT NULL NUMBER       
//	CF_NAME          VARCHAR2(30) 
	
	
	
	int recycle_code;
	String recycle_name;
	String recycle_tag;
	String recycle_check;
	String content;
	
	int cf_code;
	String cf_name;
	String title;
	
	@Override
	public String toString() {
		return "RecycleVo [recycle_code=" + recycle_code + ", recycle_name=" + recycle_name + ", recycle_tag="
				+ recycle_tag + ", recycle_check=" + recycle_check + ", content=" + content + ", cf_code=" + cf_code
				+ ", cf_name=" + cf_name + ", title=" + title + "]";
	}

	public int getRecycle_code() {
		return recycle_code;
	}

	public void setRecycle_code(int recycle_code) {
		this.recycle_code = recycle_code;
	}

	public String getRecycle_name() {
		return recycle_name;
	}

	public void setRecycle_name(String recycle_name) {
		this.recycle_name = recycle_name;
	}

	public String getRecycle_tag() {
		return recycle_tag;
	}

	public void setRecycle_tag(String recycle_tag) {
		this.recycle_tag = recycle_tag;
	}

	public String getRecycle_check() {
		return recycle_check;
	}

	public void setRecycle_check(String recycle_check) {
		this.recycle_check = recycle_check;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCf_code() {
		return cf_code;
	}

	public void setCf_code(int cf_code) {
		this.cf_code = cf_code;
	}

	public String getCf_name() {
		return cf_name;
	}

	public void setCf_name(String cf_name) {
		this.cf_name = cf_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
	
	
}
