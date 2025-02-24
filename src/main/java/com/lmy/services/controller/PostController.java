package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.lmy.services.entity.Post;
import com.lmy.services.service.PostService;
import com.lmy.services.utils.Result;
import com.lmy.services.utils.PostHotUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/post")
public class PostController {

    private Logger logger = LoggerFactory.getLogger(getClass());
    private final PostService postService;
    private final PostHotUtil postHotUtil;

    @Autowired
    public PostController(PostService postService, PostHotUtil postHotUtil){
        this.postService = postService;
        this.postHotUtil = postHotUtil;
    }
    @RequestMapping("/getPostsById")
    public Result<List<Post> > getPostsById(Integer askId, Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getPostsById(askId, userId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到动态", pageInfo.getPages())
                : new Result<>(res, "0", "动态数量为0", pageInfo.getPages());
        return json;
    }
    @RequestMapping("/getHotPost")
    public Result<List<Post> > getHotPost(Integer askId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getHotPost(askId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = new Result<>(res, "1", "获取到动态", pageInfo.getPages());
        return json;
    }
    @RequestMapping("/searchPost")
    public Result<List<Post> > searchPost(Integer askId, String key, String orderBy, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.searchPost(askId, key, orderBy);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = new Result<>(res, "1", "获取到动态", pageInfo.getPages());
        return json;
    }
    @RequestMapping("/searchFollowPost")
    public Result<List<Post> > searchFollowPost(Integer askId, String key, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.searchFollowPost(askId, key);
        PageInfo<Post> pageInfo = new PageInfo<>(res);
        Result<List<Post> > json;
        json = new Result<>(res, "1", "获取到动态", pageInfo.getPages());
        return json;
    }
    @RequestMapping("/getAllPostsByDate")
    public Result<List<Post> > getAllPostsByDate(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getAllPostsByDate(userId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = !res.isEmpty()
                ? new Result<List<Post> >(res, "1", "获取到动态",pageInfo.getPages())
                : new Result<>(res, "0", "动态数量为0", pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getFollowPosts")
    public Result<List<Post> > getFollowPosts(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getFollowPosts(userId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到动态",pageInfo.getPages())
                : new Result< >(res, "0", "动态数量为0",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getStarPosts")
    public Result<List<Post> > getStarPosts(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getStarPosts(userId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到收藏动态",pageInfo.getPages())
                : new Result< >(res, "0", "收藏动态数量为0",pageInfo.getPages());
        return json;
    }
    @RequestMapping("/getForwardPost")
    public Result<List<Post> > getForwardPost(Integer postId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Post> res = postService.getForwardPost(postId);
        PageInfo<Post> pageInfo = new PageInfo<Post>(res);
        Result<List<Post> > json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取转发记录",pageInfo.getPages())
                : new Result< >(res, "0", "没得转发",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/likePost")
    public Result<Integer> likePost(Integer userId , Integer postId){
        Result<Integer> json;
        try {
            Integer res = postService.likePost(userId ,postId);
            json = new Result<>("1","点赞成功");
            postHotUtil.countHot(postId,1.0);
        }catch (Exception e){
            json = new Result<>("0","已经点过赞了");
        }
        return json;
    }
    @RequestMapping("/cancelLikePost")
    public Result<Integer> cancelLikePost(Integer userId , Integer postId){
        Result<Integer> json;
        Integer res = postService.cancelLikePost(userId ,postId);
        json = new Result<>(Integer.toString(res),"");
        return json;
    }
    @RequestMapping("/starPost")
    public Result<Integer> starPost(Integer userId , Integer postId){
        Result<Integer> json;
        try {
            Integer res = postService.starPost(userId ,postId);
            json = new Result<>("1","收藏成功");
            postHotUtil.countHot(postId,1.5);
        }catch (Exception e){
            json = new Result<>("0","已经收藏过了");
        }
        return json;
    }
    @RequestMapping("/cancelStarPost")
    public Result<Integer> cancelStarPost(Integer userId , Integer postId){
        Result<Integer> json;
        Integer res = postService.cancelStarPost(userId ,postId);
        json = new Result<>(Integer.toString(res),"");
        return json;
    }
    @RequestMapping("/addPost")
    public Result<Integer> addPost(Post post){
        Result<Integer> json;
        try {
            Integer res = postService.addPost(post);
            json = new Result<>("1","发布动态成功");
            if(post.getForwardId()!=null){
                postHotUtil.countHot(post.getForwardId(),3.0);
            }
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","发表失败");
        }
        return json;
    }
    @RequestMapping("/deletePost")
    public Result<Integer> deletePost(Integer postId){
        Result<Integer> json;
        try {
            Integer res = postService.deletePost(postId);
            json = new Result<>("1","动态已删除");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","删除动态失败");
        }
        return json;
    }
    @RequestMapping("/getPostByPostId")
    public Result<Post> getPostByPostId(Integer postId, Integer userId){
        Result<Post> json;
        try {
            Post res = postService.getPostByPostId(postId,userId);
            json = new Result<>(res,"1","成功获取");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","未获取到");
        }
        return json;
    }
}
