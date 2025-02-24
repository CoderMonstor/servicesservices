package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Reply;
import com.lmy.services.service.ReplyService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/reply")
public class ReplyController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    private final ReplyService replyService;

    @Autowired
    public ReplyController(ReplyService replyService){
        this.replyService = replyService;
    }

    @RequestMapping("/likeReply")
    public Result<Integer> likeReply(Integer userId , Integer replyId){
        Result<Integer> json;
        try {
            Integer res = replyService.likeReply(userId ,replyId);
            json = new Result<>("1","点赞成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","已经点赞过了");
        }
        return json;
    }
    @RequestMapping("/cancelLikeReply")
    public Result<Integer> cancelLikeReply(Integer userId , Integer replyId){
        Result<Integer> json;
        Integer res = replyService.cancelLikeReply(userId ,replyId);
        json = new Result<>(Integer.toString(res),"");
        return json;
    }
    @RequestMapping("/addReply")
    public Result<Integer> addReply(Reply reply){
        Result<Integer> json;
        try {
            Integer res = replyService.addReply(reply);
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
            Integer res = replyService.deleteReply(replyId);
            json = new Result<>("1","回复已删除");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","删除回复失败");
        }
        return json;
    }
    @RequestMapping("/getReplyByCommentId")
    public Result<List<Reply>> getReplyByCommentId(Integer askId, Integer commentId, Integer page){
        PageHelper.startPage(page, 10);
        List<Reply> res = replyService.getReplyByCommentId(askId, commentId);
        PageInfo<Reply> pageInfo = new PageInfo<Reply>(res);
        Result<List<Reply>> json;
        json = !res.isEmpty()
                ? new Result<List<Reply>>(res, "1", "获取回复",pageInfo.getPages())
                : new Result<List<Reply>>(null, "0", "回复数量为0",pageInfo.getPages());
        return json;
    }
}
