package com.nhky.pojo.VO;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/8
 * Time: 21:18
 * 分页结果存储集
 **/
public class PageVO<T> {
    Integer off = 0;//开始页
    Integer end;//结束页
    Integer pageItem;//页内数
    Integer indexPage;//当前页
    List<T> list;//页内数据集
    Integer total;//共多少条
    Integer totalPage;//总页数
    String msg;

    public PageVO(int items, int index){
        this.pageItem = items;
        this.indexPage = index;
        this.off = items * (index -1);
//        this.end = items * index - 1;
        this.end = items;
    }
    public Integer getPageItem() {
        return pageItem;
    }

    public void setPageItem(Integer pageItem) {
        this.pageItem = pageItem;
    }

    public Integer getIndexPage() {
        return indexPage;
    }

    public void setIndexPage(Integer indexPage) {
        this.indexPage = indexPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }


    public Integer getOff() {
        return off;
    }

    public void setOff(Integer off) {
        this.off = off;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String getMsg() {
        return this.msg;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }
}
