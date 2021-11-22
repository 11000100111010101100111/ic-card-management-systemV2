package com.nhky.route.file;

import com.nhky.pojo.FileVO;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/22
 * Time: 9:24
 **/
@Repository
public interface FileDao {
    //上传文件信息
    public Integer uploadFile(FileVO fileVO);
    //获取文件信息
    public FileVO getFileById(Long fileId);
    //删除文件信息
    public Integer delFile();
}
