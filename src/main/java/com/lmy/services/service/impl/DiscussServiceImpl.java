package com.lmy.services.service.impl;

import com.lmy.services.entity.Discuss;
import com.lmy.services.mapper.DiscussMapper;
import com.lmy.services.service.DiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DiscussServiceImpl implements DiscussService {
    private final DiscussMapper discussMapper;

    @Autowired
    public DiscussServiceImpl(DiscussMapper discussMapper) {
        this.discussMapper = discussMapper;
    }

    @Override
    public List<Discuss> getCommentTreeByActivityId(int activityId) {
        // 获取所有的评论（包括主评论和子评论）
        List<Discuss> allComments = discussMapper.getCommentsByActivityId(activityId);

        // 构建评论树
        return buildCommentTree(allComments);
    }
    /**
     * 递归构建评论树
     */
    private List<Discuss> buildCommentTree(List<Discuss> allComments) {
        Map<Integer, Discuss> commentMap = new HashMap<>();
        List<Discuss> rootComments = new ArrayList<>();

        // 先将所有评论存入 Map，并重置 depth 值
        for (Discuss comment : allComments) {
            comment.setChildren(new ArrayList<>());
            // 重置数据库返回的 depth 值
            comment.setDepth(0);
            commentMap.put(comment.getDiscussId(), comment);
        }
        // 建立树结构并计算 depth
        for (Discuss comment : allComments) {
            if (comment.getParentId() == null || comment.getParentId() == 0) {
                // 根评论 depth 已重置为 0
                rootComments.add(comment);
            } else {
                Discuss parent = commentMap.get(comment.getParentId());
                if (parent != null) {
                    comment.setDepth(parent.getDepth() + 1);
                    parent.getChildren().add(comment);
                }
            }
        }

        // 对每个根评论的子评论进行排序
        for (Discuss rootComment : rootComments) {
            rootComment.getChildren().sort(Comparator.comparing(Discuss::getCreateTime));
        }

        return rootComments;
    }


    @Override
    public Integer addComment(Discuss discuss) {
        discussMapper.addComment(discuss);
        return discuss.getDiscussId();
    }

    @Override
    public Integer deleteComment(int discussId) {
        return discussMapper.deleteCommentTree(discussId);
    }

    @Override
    public Integer replyComment(Discuss discuss) {
        discussMapper.replyComment(discuss);
        return discuss.getDiscussId();
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

