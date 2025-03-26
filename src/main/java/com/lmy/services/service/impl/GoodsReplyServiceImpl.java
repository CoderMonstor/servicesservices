package com.lmy.services.service.impl;

import com.lmy.services.entity.GoodsReply;
import com.lmy.services.mapper.GoodsReplyMapper;
import com.lmy.services.service.GoodsReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsReplyService")
public class GoodsReplyServiceImpl implements GoodsReplyService {
    private final GoodsReplyMapper goodsReplyMapper;

    @Autowired
    public GoodsReplyServiceImpl(GoodsReplyMapper goodsReplyMapper) {
        this.goodsReplyMapper = goodsReplyMapper;
    }
    @Override
    public Integer addReply(GoodsReply reply) {
        return goodsReplyMapper.addReply(reply);
    }

    @Override
    public Integer deleteReply(Integer replyId) {
        return goodsReplyMapper.deleteReply(replyId);
    }

    @Override
    public List<GoodsReply> getReplyByCommentId(Integer askId, Integer commentId) {
        return goodsReplyMapper.getReplyByCommentId(askId, commentId);
    }
}
