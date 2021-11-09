package com.nhky.emun;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/6
 * Time: 16:18
 **/
public enum Security {

    NOMAL(0,"普通用户"),//正常访问级别
    ADMIN(1,"管理员"), //管理员访问级别
    SUPER_ADMIN(2,"超级管理员"); //超级管理员级别
    //...
    //可向下增加更多类型


    private Integer grade;
    private String type;

    Security(Integer grade,String type){
        this.grade = grade;
        this.type = type;
    }

    public Integer getGrade() { return grade; }


    public String getCode() {
        return type;
    }

}
