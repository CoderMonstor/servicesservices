package com.lmy.services.controller;

import com.lmy.services.utils.FileUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
public class UploadController {

    private final FileUtils fileUtils;
    @Autowired
    public UploadController( FileUtils fileUtils){
        this.fileUtils=fileUtils;
    }
    //上传图片
    @RequestMapping("/upLoad")
    public int upLoad(MultipartFile file, HttpServletRequest request){
        String path=request.getSession().getServletContext().getRealPath("/images/");
        if(fileUtils.upload(file,path,file.getOriginalFilename())) return 1;
        else return 0;
    }
}
