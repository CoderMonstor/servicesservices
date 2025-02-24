package com.lmy.services.service;


import com.lmy.services.entity.Comment;

import java.util.List;

public interface CommentService {

    Integer likeComment(Integer userId ,Integer commentId);

    Integer cancelLikeComment(Integer userId ,Integer commentId);

    Integer addComment(Comment comment);

    Integer deleteComment(Integer commentId);

    List<Comment> getCommentByPostId(Integer askId,Integer postId);
}
