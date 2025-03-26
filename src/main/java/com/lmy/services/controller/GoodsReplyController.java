package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.GoodsReply;
import com.lmy.services.service.GoodsReplyService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/goodsReply")
public class GoodsReplyController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    private GoodsReplyService goodsReplyService;

    @Autowired
    public GoodsReplyController(GoodsReplyService goodsReplyService) {
        this.goodsReplyService = goodsReplyService;
    }


    @RequestMapping("/addReply")
    public Result<Integer> addReply(GoodsReply reply){
        Result<Integer> json;
        try {
            Integer res = goodsReplyService.addReply(reply);
            json = new Result<>("1","回复成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","回复失败，原动态可能已被删除");
        }
        return json;
    }
    @RequestMapping("/deleteReply")
    public Result<Integer> deleteReply(Integer replyId){
        Result<Integer> json;
        try {
            Integer res = goodsReplyService.deleteReply(replyId);
            json = new Result<>("1","回复已删除");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","删除回复失败");
        }
        return json;
    }
    @RequestMapping("/getReplyByCommentId")
    public Result<List<GoodsReply>> getReplyByCommentId(Integer askId, Integer commentId, Integer page){
        PageHelper.startPage(page, 10);
        List<GoodsReply> res = goodsReplyService.getReplyByCommentId(askId, commentId);
        PageInfo<GoodsReply> pageInfo = new PageInfo<GoodsReply>(res);
        Result<List<GoodsReply>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取回复",pageInfo.getPages())
                : new Result<>(null, "0", "回复数量为0",pageInfo.getPages());
        return json;
    }
}
