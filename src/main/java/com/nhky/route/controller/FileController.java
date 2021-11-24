package com.nhky.route.controller;

import com.alibaba.fastjson.JSON;
import com.nhky.annotation.AjaxConnect;
import com.nhky.annotation.NeedSecurity;
import com.nhky.route.file.FileService;
import com.nhky.utils.DateUtil;
import com.nhky.utils.RequestUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: 波罗的海
 * Date: 2021/11/20
 * Time: 20:47
 **/
@Controller
@RequestMapping("/file")
@PropertySource("classpath:args.properties")
public class FileController {
    private ServletContext servletContext;
    @Resource(name = "fileServiceImpl")
    FileService fileService;

    @Resource(name = "fileClient")
    public String fileClient ;

    @RequestMapping("/upload")
    @ResponseBody
    @NeedSecurity
    public String uploadFile(@RequestParam("file") MultipartFile uploadFile) throws IOException {


        StringBuffer HTTP_PATH = new StringBuffer(fileClient);

        //获取上传文件的文件名字
        String fileName = uploadFile.getOriginalFilename();
        //获取文件名字的后缀
        String contextType = fileName.substring(fileName.lastIndexOf("."));
//获取存放文件在服务器中的路径
        String path ="";
//        String fileType = uploadFile.getContentType();
        switch (contextType.startsWith(".")?contextType.substring(contextType.lastIndexOf(".")+1):contextType){
            case "jpg":;
            case "jpeg":;
            case "png":;
            case "gif":
                path = "/upload/img";break;
            case "doc":;
            case "txt":;
            case "xlsx":;
            case "xls":;
            case "docx":;
            case "md":;
            case "pdf":path="/upload/doc";break;
            case "mp4":;
            case "mp3":;
            case "avi":path = "/upload/viedo";break;
            default:path="/upload/other";break;
        }

        HTTP_PATH.append(path+"/");

        path = RequestUtil.getRequest().getSession().getServletContext().getRealPath(path);


        //判断文件夹是否存在，不存在则创建
        File file = new File(path);
        if(!file.exists()) {
            file.mkdirs();
        }

        //创建新的文件名字
        String newName = DateUtil.simpleDataString() +"_" + UUID.randomUUID()+contextType;

        HTTP_PATH.append(newName);

        //声明输入流， 进行文件传输
        InputStream is = uploadFile.getInputStream();
        //指定输出文件的位置
        OutputStream os = new FileOutputStream(new File(path+"\\"+newName));

        //定义byte数组
        byte[] buffer = new byte[1024];
        int len = 0;
        while((len=is.read(buffer))!=-1) {
            os.write(buffer, 0, len);
            os.flush();
        }
        os.close();
        is.close();
        //把上传的文件路径返回到页面
        return JSON.toJSONString(HTTP_PATH);
    }

    @RequestMapping("/download")
    @ResponseBody
    @NeedSecurity
    @AjaxConnect
    public String download(HttpServletResponse response ,String filePath) throws IOException {
        String fileName = DateUtil.simpleDataString() +"_" + UUID.randomUUID()+filePath.substring(filePath.lastIndexOf("."));
        //1、设置response 响应头
        response.reset(); //设置页面不缓存,清空buffer
        response.setCharacterEncoding("UTF-8"); //字符编码
        response.setContentType("multipart/form-data"); //二进制传输数据
        //设置响应头
        response.setHeader("Content-Disposition",
                "attachment;fileName="+ URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(filePath);
        //2、 读取文件--输入流
        InputStream input=new FileInputStream(file);
        //3、 写出文件--输出流
        OutputStream out = response.getOutputStream();

        byte[] buff =new byte[1024];
        int index=0;
        //4、执行 写出操作
        while((index= input.read(buff))!= -1){
            out.write(buff, 0, index);
            out.flush();
        }
        out.close();
        input.close();
        return null;
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
