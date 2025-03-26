package com.lmy.services.service.impl;

import com.lmy.services.entity.GoodsComment;
import com.lmy.services.mapper.GoodsCommentMapper;
import com.lmy.services.service.GoodsCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsCommentService")
public class GoodsCommentServiceImpl implements GoodsCommentService {
    private GoodsCommentMapper goodsCommentMapper;

    @Autowired
    public GoodsCommentServiceImpl(GoodsCommentMapper goodsCommentMapper) {
        this.goodsCommentMapper = goodsCommentMapper;
    }
    @Override
    public Integer addComment(GoodsComment comment) {
        return goodsCommentMapper.addComment(comment);
    }

    @Override
    public Integer deleteComment(Integer commentId) {
        return goodsCommentMapper.deleteComment(commentId);
    }

    @Override
    public List<GoodsComment> getCommentByGoodsId(Integer askId, Integer goodsId) {
        return goodsCommentMapper.getCommentByGoodsId(askId, goodsId);
    }
}
