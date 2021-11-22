package com.nhky.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/22
 * Time: 9:15
 * =========================================================
 * ===              ic_util_file
 * =========================================================
 * === id              bigint         文件id
 * === file_name       varchar(128)   文件名称
 * === file_new_name   varchar(128)   文件新名称
 * === file_url        varchar(512)   文件地址
 * === has_del         int            是否删除默认0，删除1
 * === status          int            文件状态默认失效0，1为有效
 * === upload_time     varchar(64)    上传时间
 * === upload_user     bigint         上传人id
 * === del_time        varchar(64)    删除时间
 * === del_user        bigint         删除人id
 * =========================================================
 **/
public class FileVO {
    Long id;
    String file_name;
    String file_new_file;
    String file_url;
    Integer has_del;
    Integer status;
    String upload_time;
    String del_time;
    Long upload_user;
    Long del_user;

    public FileVO() {
    }

    public FileVO(String file_name, String file_new_file, String file_url, Integer has_del, Integer status, String upload_time, String del_time, Long upload_user, Long del_user) {
        this.file_name = file_name;
        this.file_new_file = file_new_file;
        this.file_url = file_url;
        this.has_del = has_del;
        this.status = status;
        this.upload_time = upload_time;
        this.del_time = del_time;
        this.upload_user = upload_user;
        this.del_user = del_user;
    }

    public FileVO(Long id, String file_name, String file_new_file, String file_url, Integer has_del, Integer status, String upload_time, String del_time, Long upload_user, Long del_user) {
        this.id = id;
        this.file_name = file_name;
        this.file_new_file = file_new_file;
        this.file_url = file_url;
        this.has_del = has_del;
        this.status = status;
        this.upload_time = upload_time;
        this.del_time = del_time;
        this.upload_user = upload_user;
        this.del_user = del_user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_new_file() {
        return file_new_file;
    }

    public void setFile_new_file(String file_new_file) {
        this.file_new_file = file_new_file;
    }

    public String getFile_url() {
        return file_url;
    }

    public void setFile_url(String file_url) {
        this.file_url = file_url;
    }

    public Integer getHas_del() {
        return has_del;
    }

    public void setHas_del(Integer has_del) {
        this.has_del = has_del;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(String upload_time) {
        this.upload_time = upload_time;
    }

    public String getDel_time() {
        return del_time;
    }

    public void setDel_time(String del_time) {
        this.del_time = del_time;
    }

    public Long getUpload_user() {
        return upload_user;
    }

    public void setUpload_user(Long upload_user) {
        this.upload_user = upload_user;
    }

    public Long getDel_user() {
        return del_user;
    }

    public void setDel_user(Long del_user) {
        this.del_user = del_user;
    }
}
