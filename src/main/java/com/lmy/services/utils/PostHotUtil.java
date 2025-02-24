package com.lmy.services.utils;

import com.lmy.services.service.PostService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * @description: 计算帖子的热度
 */
@Component
public class PostHotUtil {

    private final PostService postService;
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(FileUtils.class);

    @Autowired
    public PostHotUtil(PostService postService){
        this.postService = postService;
    }
    /*
    计算公式：
    热度=初始热度/e^(0.064*h)
    h为帖子发布时间与当前时间的差值，单位为小时
    初始热度为3.0
     */
    public void countHot(Integer postId,double baseHot){
        String date = postService.getDateByPostId(postId);
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
        Date now = new Date();
        double hot =0.0;
        try {
           Date addDate = sdf.parse(date);
           int h = (int)((now.getTime()-addDate.getTime())/(1000 * 60 * 60));
            hot= (baseHot / Math.exp(0.064 * h));
        } catch (ParseException e) {
//            e.printStackTrace();
            logger.error("时间转换错误");
        }
        DecimalFormat df = new DecimalFormat("#.###");
        hot=Double.parseDouble(df.format(hot));
        postService.updatePostHot(postId,hot);
    }

}
