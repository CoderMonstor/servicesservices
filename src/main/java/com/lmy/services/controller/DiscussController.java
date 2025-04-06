package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Discuss;
import com.lmy.services.service.DiscussService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/activityComment")
public class DiscussController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    private final DiscussService discussService;

    @Autowired
    public DiscussController(DiscussService discussService) {
        this.discussService = discussService;
    }

    @RequestMapping("/list")
    public Result<List<Discuss>> getCommentsByActivityId(@RequestParam int activityId) {
        List<Discuss> res = discussService.getCommentTreeByActivityId(activityId);
        return !res.isEmpty()
                ? new Result<>(res, "1", "获取到评论")
                : new Result<>(null, "0", "评论数量为0");
    }

    @RequestMapping("/add")
    public Result<Integer> addComment(Discuss discuss){
        try {
            Integer discussId = discussService.addComment(discuss);
            return new Result<>(discussId, "1", "评论成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            return new Result<>(null, "0", "评论失败，原动态可能已被删除");
        }
    }

    @RequestMapping("/reply")
    public Result<Integer> replyComment(Discuss discuss) {
        try {
            Integer discussId = discussService.replyComment(discuss);
            return new Result<>(discussId, "1", "回复成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            return new Result<>(null, "0", "回复失败");
        }
    }
}

