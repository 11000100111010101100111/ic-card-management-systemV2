package com.nhky.route.file;

import com.nhky.pojo.FileVO;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/22
 * Time: 9:23
 **/
public interface FileService {
    public Integer uploadFile();
    public FileVO getFileById();
    public Integer delFile();
}
