package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Discuss;
import com.lmy.services.service.ActivitiesCommentService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/activityComment")
public class ActivitiesCommentController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    private final ActivitiesCommentService activitiesCommentService;

    @Autowired
    public ActivitiesCommentController(ActivitiesCommentService activitiesCommentService) {
        this.activitiesCommentService = activitiesCommentService;
    }

    /**
     * 获取某个活动的所有评论
     * @param activityId 活动ID
     * @return 评论列表
     */
    @RequestMapping("/list")
    public Result<List<Discuss>> getCommentsByActivityId(@RequestParam int activityId, @RequestParam int page) {
        PageHelper.startPage(page, 10);
        List<Discuss> res = activitiesCommentService.getCommentsByActivityId(activityId);
        PageInfo<Discuss> pageInfo = new PageInfo<>(res);
        Result<List<Discuss>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到评论",pageInfo.getPages())
                : new Result<>(null,"0","评论数量为0",pageInfo.getPages());
        return json;
    }

    /**
     * 添加评论
     * @param discuss 评论对象（包含userId、activityId、content等）
     * @return 操作结果
     */
    @RequestMapping("/add")
    public Result<Integer> addComment(@RequestBody Discuss discuss){
        Result<Integer> json;
        try {
            Integer res = activitiesCommentService.addComment(discuss);
            json = new Result<>("1","评论成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","评论失败，原动态可能已被删除");
        }
        return json;
    }

    /**
     * 删除评论
     * @param discussId 评论ID
     * @return 操作结果
     */
    @RequestMapping("/delete")
    public Result<Integer> deleteComment(@RequestParam int discussId) {
        Result<Integer> json;
        try {
            Integer res = activitiesCommentService.deleteComment(discussId);
            json = new Result<>("1","评论删除成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","评论删除失败");
        }
        return json;
    }

    /**
     *  回复评论
     * @param discuss 回复的评论对象（包含userId、activityId、content、replyId）
     * @return 操作结果
     */
    @RequestMapping("/reply")
    public Result<Integer> replyComment(@RequestBody Discuss discuss) {
        Result<Integer> json;
        try {
            Integer res = activitiesCommentService.replyComment(discuss);
            json = new Result<>("1","回复成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","回复失败");
        }
        return json;
    }
    @RequestMapping("/getMainComments")
    public Result<List<Discuss>> getMainComments(@RequestParam int activityId, @RequestParam int page) {
        PageHelper.startPage(page, 10);
        List<Discuss> res = activitiesCommentService.getMainComments(activityId);
        PageInfo<Discuss> pageInfo = new PageInfo<>(res);
        Result<List<Discuss>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到评论",pageInfo.getPages())
                : new Result<>(null,"0","评论数量为0",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getChildComments")
    public Result<List<Discuss>> getChildComments(@RequestParam int parentId, @RequestParam int page) {
        PageHelper.startPage(page, 10);
        List<Discuss> res = activitiesCommentService.getChildComments(parentId);
        PageInfo<Discuss> pageInfo = new PageInfo<>(res);
        Result<List<Discuss>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到评论",pageInfo.getPages())
                : new Result<>(null,"0","评论数量为0",pageInfo.getPages());
        return json;
    }

}
