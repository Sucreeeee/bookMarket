package com.atguigu.pojo;

import java.util.List;

public class Page <T>{
    public static final Integer PAGE_SIZE = 4;
    private Integer pageNo;
    private Integer PageTotal;
    private Integer PageSize = PAGE_SIZE;
    private Integer pageTotalCount;
    private List<T> items;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {

        this.pageNo = pageNo;
    }

    public Integer getPageTotal() {
        return PageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        PageTotal = pageTotal;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", PageTotal=" + PageTotal +
                ", PageSize=" + PageSize +
                ", pageTotalCount=" + pageTotalCount +
                ", items=" + items +
                ", url='" + url + '\'' +
                '}';
    }
}
