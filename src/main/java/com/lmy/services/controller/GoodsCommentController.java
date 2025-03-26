package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.GoodsComment;
import com.lmy.services.service.GoodsCommentService;
import com.lmy.services.utils.Result;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/goodsComment")
public class GoodsCommentController {
    private Logger logger = LoggerFactory.getLogger(GoodsCommentController.class);
    private final GoodsCommentService goodsCommentService;

    @Autowired
    public GoodsCommentController(GoodsCommentService goodsCommentService) {
        this.goodsCommentService = goodsCommentService;
    }

    @RequestMapping("/addComment")
    public Result<Integer> addComment(GoodsComment comment){
        Result<Integer> json;
        try {
            Integer res = goodsCommentService.addComment(comment);
            json = new Result<>("1","评论成功");
        } catch (Exception e) {
            // 使用 Supplier<String> 包装日志内容
            logger.warn(() -> "Add comment failed: " + e.toString());
            json = new Result<>("0","评论失败，原动态可能已被删除");
        }
        return json;
    }
    @RequestMapping("/deleteComment")
    public Result<Integer> deleteComment(Integer commentId){
        Result<Integer> json;
        try {
            Integer res = goodsCommentService.deleteComment(commentId);
            json = new Result<>("1","评论已删除");
        }catch (Exception e){
            logger.warn(() -> "Add comment failed: " + e.toString());
            json = new Result<>("0","删除评论失败");
        }
        return json;
    }
    @RequestMapping("/getCommentByGoodsId")
    public Result<List<GoodsComment>> getCommentByGoodsId(Integer askId, Integer goodsId, Integer page){
        PageHelper.startPage(page, 10);
        List<GoodsComment> res = goodsCommentService.getCommentByGoodsId(askId, goodsId);
        PageInfo<GoodsComment> pageInfo = new PageInfo<GoodsComment>(res);
        Result<List<GoodsComment>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到评论",pageInfo.getPages())
                : new Result<>(null, "0", "评论数量为0",pageInfo.getPages());
        return json;
    }

}
