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
    Integer off;//开始页
    Integer end;//结束页
    List<T> data;//页内数据集

    public PageVO(int items, int index){
        this.off = items * (index -1);
        this.end = items * index - 1;
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

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
