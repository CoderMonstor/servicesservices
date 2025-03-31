package com.lmy.services.service.impl;

import com.lmy.services.entity.Discuss;
import com.lmy.services.mapper.ActivitiesCommentMapper;
import com.lmy.services.service.ActivitiesCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivitiesCommentServiceImpl implements ActivitiesCommentService {
    private final ActivitiesCommentMapper activitiesCommentMapper;

    @Autowired
    public ActivitiesCommentServiceImpl(ActivitiesCommentMapper activitiesCommentMapper) {
        this.activitiesCommentMapper = activitiesCommentMapper;
    }
    @Override
    public List<Discuss> getCommentsByActivityId(int activityId) {
        return activitiesCommentMapper.getCommentsByActivityId(activityId);
    }

    @Override
    public Integer addComment(Discuss discuss) {
        return activitiesCommentMapper.addComment(discuss);
    }

    @Override
    public Integer deleteComment(int discussId) {
        return activitiesCommentMapper.deleteComment(discussId);
    }

    @Override
    public Integer replyComment(Discuss discuss) {
        return activitiesCommentMapper.replyComment(discuss);
    }

    @Override
    public List<Discuss> getMainComments(int activityId) {
        return activitiesCommentMapper.getMainComments(activityId);
    }

    @Override
    public List<Discuss> getChildComments(int parentId) {
        return activitiesCommentMapper.getChildComments(parentId);
    }
}
