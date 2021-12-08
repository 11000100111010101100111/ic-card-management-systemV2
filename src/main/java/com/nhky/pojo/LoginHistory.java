package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/12/8
 * Time: 20:37
 * 登录历史表，保存（主机+用户id+保存时间） = 用户记住账号
 *  ============ic_login_history============
 *  id            bigint       表id
 *  uid           bigint       用户登录账号id
 *  ip            varchar(64)  用户登录主机ip
 *  is_save       int          是否保存登录信息到主机
 *  create_time   varchar(64)  创建时间
 *  save_times    int          保存时间(单位秒），默认10小时
 *  status        int          状态
 *  leavel        int          是否默认登录（账号），0表示不默认登录
 **/
public class LoginHistory {
    Long id;
    Long uid;
    String ip;
    Integer is_save;
    String create_time;
    Integer save_times;
    Integer status;
    Integer leavel;

    public LoginHistory(Long uid, String ip, Integer is_save, String create_time, Integer save_times, Integer status, Integer leavel) {
        this.uid = uid;
        this.ip = ip;
        this.is_save = is_save;
        this.create_time = create_time;
        this.save_times = save_times;
        this.status = status;
        this.leavel = leavel;
    }

    public LoginHistory(Long id, Long uid, String ip, Integer is_save, String create_time, Integer save_times, Integer status, Integer leavel) {
        this.id = id;
        this.uid = uid;
        this.ip = ip;
        this.is_save = is_save;
        this.create_time = create_time;
        this.save_times = save_times;
        this.status = status;
        this.leavel = leavel;
    }

    public LoginHistory(String ip, Integer save_times) {
        this.ip = ip;
        this.save_times = save_times;
    }

    public LoginHistory(Long uid, String ip, Integer is_save, Integer save_times, Integer status, Integer leavel) {
        this.uid = uid;
        this.ip = ip;
        this.is_save = is_save;
        this.save_times = save_times;
        this.status = status;
        this.leavel = leavel;
    }

    public LoginHistory() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getIs_save() {
        return is_save;
    }

    public void setIs_save(Integer is_save) {
        this.is_save = is_save;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public Integer getSave_times() {
        return save_times;
    }

    public void setSave_times(Integer save_times) {
        this.save_times = save_times;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
