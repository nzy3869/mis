package cn.wbull.util;

public class PageUtil<T> {
	
	private int limit;//每页数据条数
	private int offset;//第几页
	private String search;//搜索内容
	private String sort;//排序
	private String order;//排序规则
	private long total;//数据总条数
	private int page;//数据总页数
	private T rows;//数据集
	
	
	
	public PageUtil() {
		super();
	}
	/**
	 * 
	 * @param limit 每页数据条数
	 * @param offset 第几页
	 * @param search 搜索内容
	 * @param sort 排序
	 * @param order 排序规则
	 * @param total 数据总条数
	 * @param page 数据总页数
	 * @param rows 数据集
	 */
	public PageUtil(int limit, int offset, String search, String sort, String order,long total,int page, T rows) {
		super();
		this.limit = limit;
		this.offset = offset;
		this.search = search;
		this.sort = sort;
		this.order = order;
		this.total = total;
		this.page = page;
		this.rows = rows;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getLimit() {
		return limit;
	}
	public T getRows() {
		return rows;
	}
	public void setRows(T rows) {
		this.rows = rows;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}

}
