package com.lmy.services.service.impl;

import com.lmy.services.entity.Discuss;
import com.lmy.services.mapper.DiscussMapper;
import com.lmy.services.service.ActivitiesCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivitiesCommentServiceImpl implements ActivitiesCommentService {
    private final DiscussMapper discussMapper;

    @Autowired
    public ActivitiesCommentServiceImpl(DiscussMapper discussMapper) {
        this.discussMapper = discussMapper;
    }
    @Override
    public List<Discuss> getCommentsByActivityId(int activityId) {
        return discussMapper.getCommentsByActivityId(activityId);
    }

    @Override
    public Integer addComment(Discuss discuss) {
        return discussMapper.addComment(discuss);
    }

    @Override
    public Integer deleteComment(int discussId) {
        return discussMapper.deleteComment(discussId);
    }

    @Override
    public Integer replyComment(Discuss discuss) {
        return discussMapper.replyComment(discuss);
    }

    @Override
    public List<Discuss> getMainComments(int activityId) {
        return discussMapper.getMainComments(activityId);
    }

    @Override
    public List<Discuss> getChildComments(int parentId) {
        return discussMapper.getChildComments(parentId);
    }
}
