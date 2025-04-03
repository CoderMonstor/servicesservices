package com.lmy.services.service.impl;

import com.lmy.services.entity.Activities;
import com.lmy.services.entity.User;
import com.lmy.services.mapper.ActivitiesMapper;
import com.lmy.services.service.ActivitiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivitiesServiceImpl implements ActivitiesService {

    private final ActivitiesMapper activitiesMapper;

    @Autowired
    public ActivitiesServiceImpl(ActivitiesMapper activitiesMapper) {
        this.activitiesMapper = activitiesMapper;
    }

    @Override
    public Integer addActivities(Activities activities) {
        return activitiesMapper.addActivities(activities);
    }

    @Override
    public Integer deleteActivities(Integer activityId) {
        return activitiesMapper.deleteActivities(activityId);
    }

    @Override
    public Activities getActivitiesById(Integer userId, Integer activityId) {
        return activitiesMapper.getActivitiesById(userId, activityId);
    }

    @Override
    public List<Activities> getActivitiesByUser(Integer userId) {
        return activitiesMapper.getActivitiesByUser(userId);
    }

    @Override
    public Integer collectActivity(Integer userId, Integer activityId) {
        return activitiesMapper.collectActivity(userId, activityId);
    }

    @Override
    public Integer canselCollectActivity(Integer userId, Integer activityId) {
        return activitiesMapper.canselCollectActivity(userId, activityId);
    }

    @Override
    public List<Activities> getAllActivities(Integer askId) {
        return activitiesMapper.getAllActivities(askId);
    }

    @Override
    public List<Activities> searchActivities(Integer askId, String key) {
        return activitiesMapper.searchActivities(askId, key);
    }

    @Override
    public Integer updateActivities(Activities activities) {
        return activitiesMapper.updateActivities(activities);
    }

    @Override
    public Integer changeStatus(Integer activityId, Integer status) {
        return activitiesMapper.changeStatus(activityId, status);
    }

    @Override
    public Object getPraiseCount(Integer activityId) {
        return activitiesMapper.getPraiseCount(activityId);
    }

    @Override
    public Object getCollectCount(Integer activityId) {
        return activitiesMapper.getCollectCount(activityId);
    }

    @Override
    public Integer registerActivity(Integer userId, Integer activityId) {
        return activitiesMapper.registerActivity(userId, activityId);
    }



    @Override
    public Integer cancelRegistration(Integer userId, Integer activityId) {
        return activitiesMapper.cancelRegistration(userId, activityId);
    }

    @Override
    public Integer getRegistrationStatus(Integer userId, Integer activityId) {
        return activitiesMapper.getRegistrationStatus(userId, activityId);
    }

    @Override
    public List<User> getActivityParticipants(Integer activityId) {
        return activitiesMapper.getActivityParticipants(activityId);
    }

    @Override
    public Integer priseActivity(Integer userId, Integer activityId) {
        return activitiesMapper.priseActivity(userId, activityId);
    }

    @Override
    public Integer canselPraiseActivity(Integer userId, Integer activityId) {
        return activitiesMapper.canselPraiseActivity(userId, activityId);
    }

    @Override
    public Activities getActivityDetail(Integer userId, Integer activityId) {
        return activitiesMapper.getActivityDetail(userId, activityId);
    }
}
