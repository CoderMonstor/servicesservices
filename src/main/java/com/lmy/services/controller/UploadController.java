package com.lmy.services.controller;

import com.lmy.services.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
public class UploadController {

    private final FileUtils fileUtils;

    // 从 application.yml 中读取路径配置
    @Value("${image_resource.windows}")
    private String windowsPath;

    @Value("${image_resource.linux}")
    private String linuxPath;
    @Autowired
    public UploadController( FileUtils fileUtils){
        this.fileUtils=fileUtils;
    }
    //上传图片
    @RequestMapping("/upLoad")
//    public int upLoad(MultipartFile file, HttpServletRequest request){
    public int upLoad(MultipartFile file){
        System.out.println(file.getOriginalFilename());
//        String path=request.getSession().getServletContext().getRealPath("images/");
        // upload:
        //  windows: D:/images
        //  linux: /tmp/images
        //如果当前设备是windows，那么使用upload:windows,如果是linux，那么使用upload:linux

        String path;
        if (System.getProperty("os.name").toLowerCase().startsWith("win")) {
            path = windowsPath;
        } else {
            path = linuxPath;
        }
        System.out.println(path);
        if(fileUtils.upload(file,path,file.getOriginalFilename())) return 1;
        else return 0;
    }
}
