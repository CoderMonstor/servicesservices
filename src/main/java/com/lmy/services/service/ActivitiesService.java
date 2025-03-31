package com.lmy.services.service;


import com.lmy.services.entity.Activities;
import com.lmy.services.entity.User;

import java.util.List;

/**
 * 同城活动：(SameCityActivities)表服务接口
 *
 */
public interface ActivitiesService  {

    Integer addActivities(Activities activities);

    Integer deleteActivities(Integer activityId);

    Activities getActivitiesById(Integer askId, Integer activityId);

    List<Activities> getActivitiesByUser(Integer userId);

    Integer collectActivity(Integer userId, Integer activityId);

    Integer canselCollectActivity(Integer userId, Integer activityId);

    List<Activities> getAllActivities(Integer askId);

    List<Activities> searchActivities(Integer askId, String key);

    Integer updateActivities(Activities activities);

    Integer changeStatus(Integer activityId, Integer status);

    Object getPraiseCount(Integer activityId);

    Object getCollectCount(Integer activityId);

    Integer registerActivity(Integer userId, Integer activityId);

    Integer cancelRegistration(Integer userId, Integer activityId);

    Integer getRegistrationStatus(Integer userId, Integer activityId);

    List<User> getActivityParticipants(Integer activityId);

    Integer priseActivity(Integer userId, Integer activityId);

    Integer canselPraiseActivity(Integer userId, Integer activityId);
}
