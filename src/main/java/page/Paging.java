package page;

import java.util.ArrayList;
import java.util.List;

public class Paging {

	private Object page; // 한 페이지의 방명록
	private List<Integer> pageList;
	private int currentPage; // 현재 페이지
	private int lastPage; // 마지막 페이지
	private int pageLimit = 10; // 옵션값을 선택하지 않았을때 10으로 기본값 설정
	private int listLimit = 5;
	
	public Paging(Object page, int lastPage) {
		this.page = page;
		this.lastPage = lastPage;
		setPageList();
	}
	
	public Paging(Object page, int currentPage, int lastPage) {
		this(page, lastPage);
		this.currentPage = currentPage; // 현재페이지가 첫번째페이지 또는 마지막페이지라면 값이 바뀌기 때문이다.
	}
	
	public Paging(Object page, int currentPage, int lastPage, int pageLimit, int listLimit) { // 한 페이지의 방명록, 현재 페이지, 총 페이지수, 옵션값, 5
		this(page, lastPage); // Overloading된 다른 생성자 메서드를 호출한다.
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.listLimit = listLimit;
	}
	
	public Object getPage() { // 한 페이지에 보여줄 방명록 목록
		return page;
	}
	
	public List<Integer> getPageList() { // 페이지 리스트 자르기
		int start = 0;
		int end = listLimit; // listLimit = 5
		if(currentPage > (listLimit / 2) + 1) {
			start = currentPage - (listLimit / 2 + 1);
			end = currentPage + (listLimit / 2) - (listLimit % 2 == 0 ? 1 : 0);
		}
		if(end > lastPage) {
			end = lastPage;
		}
		return pageList.subList(start, end); // 페이지 리스트
	}
	
	private void setPageList() { // 잘라준 페이지 리스트 저장
		pageList = new ArrayList<Integer>();
		for(int i = 1; i <= lastPage; i++) {
			pageList.add(i);
		}
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getPrevPage() {
		return currentPage == 1 ? -1 : currentPage - 1; // 현재페이지가 1이면 -1을 반환 , 아니면 현재페이지 - 1을 반환
	}
	
	public int getNextPage() {
		return currentPage == lastPage ? -1 : currentPage + 1;
	}
	
	public int getLastPage() {
		return lastPage;
	}
	
	public int getPageLimit() {
		return pageLimit;
	}
	
	public int getListLimit() {
		return listLimit;
	}
}