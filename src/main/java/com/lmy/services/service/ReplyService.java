package com.lmy.services.service;


import com.lmy.services.entity.Reply;

import java.util.List;

public interface  ReplyService {
    List<Reply> getReplyByCommentId(Integer askId, Integer commentId);
    Integer likeReply(Integer userId ,Integer replyId);
    Integer cancelLikeReply(Integer userId ,Integer replyId);
    Integer addReply(Reply reply);
    Integer deleteReply(Integer replyId);
}
