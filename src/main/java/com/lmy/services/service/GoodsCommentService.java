package com.lmy.services.service;

import com.lmy.services.entity.GoodsComment;

import java.util.List;

public interface GoodsCommentService {
    Integer addComment(GoodsComment comment);

    Integer deleteComment(Integer commentId);

    List<GoodsComment> getCommentByGoodsId(Integer askId, Integer goodsId);
}
