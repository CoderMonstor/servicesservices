package com.lmy.services.service;

import com.lmy.services.entity.GoodsReply;

import java.util.List;

public interface GoodsReplyService {
    Integer addReply(GoodsReply reply);

    Integer deleteReply(Integer replyId);

    List<GoodsReply> getReplyByCommentId(Integer askId, Integer commentId);
}
