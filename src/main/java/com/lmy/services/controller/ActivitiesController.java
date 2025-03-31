package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Activities;
import com.lmy.services.entity.User;
import com.lmy.services.service.ActivitiesService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/activities")
public class ActivitiesController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    private final ActivitiesService activitiesService;

    @Autowired
    public ActivitiesController(ActivitiesService activitiesService) {
        this.activitiesService = activitiesService;
    }

    /**
     * 发布活动
     * @param activities 活动
     */
    @RequestMapping("/add")
    public Result<Integer> addActivities(Activities activities){
        Result<Integer> json;
        try {
            Integer res = activitiesService.addActivities(activities);
            json = new Result<>("1","发布活动成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","发布活动失败");
        }
        return json;
    }

    /**
     * 删除活动
     * @param activityId 活动id
     */
    @RequestMapping("/delete")
    public Result<Integer> deleteActivities(Integer activityId){
        Result<Integer> json;
        try {
            Integer res = activitiesService.deleteActivities(activityId);
            json = new Result<>("1","删除活动成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","删除活动失败");
        }
        return json;
    }

    @RequestMapping("/getActivitiesById")
    public Result<Activities> getActivitiesById(Integer askId,Integer activityId){
        Result<Activities> json;
        try {
            Activities res = activitiesService.getActivitiesById(askId,activityId);
            json=new Result<>(res,"1","获取活动成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>(null,"获取活动失败");
        }
        return json;
    }

    @RequestMapping("/getActivitiesByUser")
    public Result<List<Activities>> getActivitiesByUser(Integer userId,Integer page){
        PageHelper.startPage(page,10);
        List<Activities> res = activitiesService.getActivitiesByUser(userId);
        PageInfo<Activities> pageInfo = new PageInfo<Activities>(res);
        Result<List<Activities>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到活动",pageInfo.getPages())
                : new Result<>(null,"0","活动数量为0",pageInfo.getPages());
        return json;
    }
    @RequestMapping("/collectActivity")
    public Result<Integer> collectActivity(Integer userId,Integer activityId){
        Result<Integer> json;
        try {
            Integer res = activitiesService.collectActivity(userId,activityId);
            json=new Result<>("1","收藏活动成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>(null,"收藏活动失败");
        }
        return json;
    }

    @RequestMapping("/canselCollectActivity")
    public Result<Integer> canselCollectActivity(Integer userId,Integer activityId){
        Result<Integer> json;
        try {
            Integer res = activitiesService.canselCollectActivity(userId,activityId);
            json=new Result<>("1","取消收藏活动成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>(null,"取消收藏活动失败");
        }
        return json;
    }
    @RequestMapping("/getAllActivities")
    public Result<List<Activities>> getAllActivities(Integer askId,Integer page){
        PageHelper.startPage(page,10);
        List<Activities> res = activitiesService.getAllActivities(askId);
        PageInfo<Activities> pageInfo = new PageInfo<Activities>(res);
        Result<List<Activities>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到活动",pageInfo.getPages())
                : new Result<>(null,"0","活动数量为0",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/searchActivities")
    public Result<List<Activities>> searchActivities(Integer askId,String key,Integer page){
        PageHelper.startPage(page,10);
        List<Activities> res = activitiesService.searchActivities(askId,key);
        PageInfo<Activities> pageInfo = new PageInfo<Activities>(res);
        Result<List<Activities>> json;
        json=!res.isEmpty()
                ? new Result<>(res,"1","获取到活动",pageInfo.getPages())
                : new Result<>(null,"0","活动数量为0",pageInfo.getPages());
        return json;
    }
    @RequestMapping("/update")
    public Result<Integer> updateActivities(Activities activities) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.updateActivities(activities);
            json = new Result<>("1", "更新活动成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "更新活动失败");
        }
        return json;
    }
    @RequestMapping("/changeStatus")
    public Result<Integer> changeStatus(Integer activityId, Integer status) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.changeStatus(activityId, status);
            json = new Result<>("1", "活动变更成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "状态变更失败");
        }
        return json;
    }
    @RequestMapping("/getStatistics")
    public Result<Map<String, Object>> getStatistics(Integer activityId) {
        Result<Map<String, Object>> json;
        try {
            Map<String, Object> stats = new HashMap<>();
            stats.put("praises", activitiesService.getPraiseCount(activityId)); // 点赞量
            stats.put("collections", activitiesService.getCollectCount(activityId)); // 收藏量
            json = new Result<>(stats, "1", "获取统计成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>(null, "0", "获取统计失败");
        }
        return json;
    }

    @RequestMapping("/register")
    public Result<Integer> registerActivity(Integer userId, Integer activityId) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.registerActivity(userId, activityId);
            json = new Result<>("1", "报名成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "报名失败");
        }
        return json;
    }

    /**
     * 取消报名
     * @param userId 用户id
     * @param activityId 活动id
     */
    @RequestMapping("/cancelRegister")
    public Result<Integer> cancelRegister(Integer userId, Integer activityId) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.cancelRegistration(userId, activityId);
            json = new Result<>("1", "取消报名成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "取消报名失败");
        }
        return json;
    }

    /**
     * @param userId 用户id
     * @param activityId 活动id
     * @return 状态码 1：已报名 0：未报名
     */
    @RequestMapping("/getRegistrationStatus")
    public Result<Integer> getRegistrationStatus(Integer userId, Integer activityId) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.getRegistrationStatus(userId, activityId);
            json = new Result<>("1", "获取报名状态成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "获取报名状态失败");
        }
        return json;
    }

    /**
     * 有哪些人报名
     * @param activityId 活动id
     * @return 当前报名的人
     */
    @RequestMapping("/getActivityParticipants")
    public Result<List<User>> getActivityParticipants(Integer activityId) {
        Result<List<User>> json;
        try {
            List<User> res = activitiesService.getActivityParticipants(activityId);
            json = new Result<>(res, "1", "获取报名人成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>(null, "0", "获取报名人失败");
        }
        return json;
    }

    @RequestMapping("/praise")
    public Result<Integer> priseActivity(Integer userId, Integer activityId) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.priseActivity(userId, activityId);
            json = new Result<>("1", "点赞成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "点赞失败");
        }
        return json;
    }
    @RequestMapping("/cancelPraise")
    public Result<Integer> cancelPraiseActivity(Integer userId, Integer activityId) {
        Result<Integer> json;
        try {
            Integer res = activitiesService.canselPraiseActivity(userId, activityId);
            json = new Result<>("1", "取消点赞成功");
        } catch (Exception e) {
            logger.warn(e.toString());
            json = new Result<>("0", "取消点赞失败");
        }
        return json;
    }
}
