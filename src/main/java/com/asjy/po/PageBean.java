package com.asjy.po;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: lilinlin
 * @Date: 2021/2/26
 * @Description: com.asjy.po
 * @version: 1.0
 */
public class PageBean<T> {
    private Integer pageNow=1;
    private Integer pageSize=12;
    private Integer pageCount=0;
    private Integer total=0;
    private Integer start=0;
    private List<T> list;
    private Integer navigation = 7;
    private List<Integer> pages;

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNow=" + pageNow +
                ", pageSize=" + pageSize +
                ", pageCount=" + pageCount +
                ", total=" + total +
                ", start=" + start +
                ", list=" + list +
                ", navigation=" + navigation +
                ", pages=" + pages +
                '}';
    }

    public List<Integer> getPages() {
        pages = new ArrayList<>();
        int start=0;
        int end=0;
        if(pageNow<4){
            start = 1;
            end = Math.min(pageCount,navigation);
        }else{
            start = Math.min(pageNow-3,pageCount-navigation);
            end = Math.min(pageNow+3,pageCount);
        }
        System.out.println(start+":"+end);
        for (int i = start; i <= end; i++) {
            pages.add(i);
        }
        return pages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
     }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
       return this.pageCount ;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        pageCount = total%pageSize==0?total/pageSize:total/pageSize+1;
        this.total = total;
    }

    public Integer getStart() {
        return (pageNow-1)*pageSize;
    }
}