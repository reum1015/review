package review.jsp.helper;

public class PageHelper {
	/***** GET파라미터로 처리할 값 *****/
    private int page = 1; 			// 현재 페이지 번호

    /***** DB에서 조회한 결과 값 *****/
    private int total_count = 0;		// 전체 글 개수 조회

    /***** 개발자가 정의해야 하는 값 *****/
    private int list_count = 10;		// 한 페이지에 보여질 글의 목록 수
    private int group_count = 5;		// 한 그룹에 표시할 페이지번호 개수

	/***** 연산처리가 필요한 값 *****/
	private int totalPage = 0;		// 전체 페이지 수
    private int startPage = 0;		// 현재 그룹의 시작 페이지 
    private int endPage = 0;		// 현재 그룹의 마지막 페이지
    private int prevPage = 0;		// 이전 그룹의 마지막 페이지
    private int nextPage = 0;		// 이전 그룹의 첫 페이지
    private int limit_start = 0;		// MySQL의 Limit 시작 위치

	// ----------- 싱글톤 객체 생성 시작 ----------
	private static PageHelper current = null;

	public static PageHelper getInstance() {
		if (current == null) {
			current = new PageHelper();
		}
		// 객체 생성 후, 계산에 필요한 값들을 연산처리를 위한 메서드에 전달한다.
		
		return current;
	}

	public static void freeInstance() { current = null; }

	private PageHelper() { super(); }
	// ----------- 싱글톤 객체 생성 끝 ----------
	
	/** 페이지 구현에 필요한 계산식을 처리하는 메서드 */
	public void pageProcess(int page, int total_count, int list_count, int group_count) {
		this.page = page;
		this.total_count = total_count;
		this.list_count = list_count;
		this.group_count = group_count;

		// 전체 페이지 수
	    totalPage = ((total_count-1)/list_count)+1;

	    // 현재 페이지에 대한 오차 조절
	    if (page < 0) {
	    	page = 1;
	    }
	    
	    if (page > totalPage) {
	    	page = totalPage;
	    }

	    // 현재 페이징 그룹의 시작 페이지 번호
	    startPage = ((page - 1) / group_count) * group_count + 1;

	    // 현재 페이징 그룹의 끝 페이지 번호
	    endPage = (((startPage - 1) + group_count) / group_count) * group_count;

	    // 끝 페이지 번호가 전체 페이지수를 초과하면 오차범위 조절
	    if (endPage > totalPage) { endPage = totalPage; }

	    // 이전 그룹의 마지막 페이지
	    if (startPage > group_count) { prevPage = startPage - 1; }
	    else { prevPage = 0; }

	    // 다음 그룹의 첫 페이지
	    if (endPage < totalPage) { nextPage = endPage + 1; }
	    else { nextPage = 0; }

	    // 검색 범위의 시작 위치
	    limit_start = (page-1) * list_count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getList_count() {
		return list_count;
	}

	public void setList_count(int list_count) {
		this.list_count = list_count;
	}

	public int getGroup_count() {
		return group_count;
	}

	public void setGroup_count(int group_count) {
		this.group_count = group_count;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getLimit_start() {
		return limit_start;
	}

	public void setLimit_start(int limit_start) {
		this.limit_start = limit_start;
	}

	public static PageHelper getCurrent() {
		return current;
	}

	public static void setCurrent(PageHelper current) {
		PageHelper.current = current;
	}

	@Override
	public String toString() {
		return "PageHelper [page=" + page + ", total_count=" + total_count + ", list_count=" + list_count
				+ ", group_count=" + group_count + ", totalPage=" + totalPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", limit_start="
				+ limit_start + "]";
	}


	
}
