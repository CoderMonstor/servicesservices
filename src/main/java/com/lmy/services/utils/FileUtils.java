package com.lmy.services.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/*
此类用于文件上传
 */
@Component
public class FileUtils {

    private static final Logger logger = LoggerFactory.getLogger(FileUtils.class);

    /*
     * @param file 文件
     * */
    public boolean upload(MultipartFile file, String path, String filename) {
        System.out.println("--------------------------------------file upload start----------------------------");
        System.out.println(path);
        System.out.println(filename);
        if (file.isEmpty()) {
            logger.error("文件为空");
            return false;
        }
        String realPath = path + filename;
        System.out.println(realPath);
        File dest = new File(realPath);
        System.out.println("--------------------------------------file upload have been ready----------------------------");
        // 判断文件父目录是否存在
        if (!dest.getParentFile().exists()) {
            if (!dest.getParentFile().mkdirs()) {
                logger.error("创建父目录失败: {}", dest.getParentFile().getAbsolutePath());
                return false;
            }
        }

        if (!dest.exists()) {
            try {
                if (!dest.createNewFile()) {
                    logger.error("创建文件失败: {}", dest.getAbsolutePath());
                    return false;
                }
            } catch (IOException e) {
                logger.error("创建文件失败: {}", dest.getAbsolutePath(), e);
                return false;
            }
        }

        try {
            // 保存文件
            file.transferTo(dest);
            System.out.println("--------------------------------------file upload success,and the path is ----------------------------");
            System.out.println(dest);
            return true;
        } catch (IllegalStateException | IOException e) {
            logger.error("文件上传失败: {}", dest.getAbsolutePath(), e);
            return false;
        }
    }
}
