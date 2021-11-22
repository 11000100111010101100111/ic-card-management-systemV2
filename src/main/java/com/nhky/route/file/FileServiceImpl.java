package com.nhky.route.file;

import com.nhky.pojo.FileVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/22
 * Time: 9:24
 **/
@Service("fileServiceImpl")
public class FileServiceImpl implements FileService {
    @Resource(name = "fileDao")
    FileDao fileDao;

    @Override
    public Integer uploadFile() {
        return null;
    }

    @Override
    public FileVO getFileById() {
        return null;
    }

    @Override
    public Integer delFile() {
        return null;
    }
}
