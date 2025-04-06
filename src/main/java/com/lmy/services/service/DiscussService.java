package com.lmy.services.service;

import com.lmy.services.entity.Discuss;

import java.util.List;

public interface DiscussService {
    List<Discuss> getCommentTreeByActivityId(int activityId);
    Integer addComment(Discuss discuss);
    Integer deleteComment(int discussId);
    Integer replyComment(Discuss discuss);
    List<Discuss> getMainComments(int activityId);
    List<Discuss> getChildComments(int parentId);
}



