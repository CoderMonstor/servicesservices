package com.lmy.services.service.impl;

import com.lmy.services.entity.Goods;
import com.lmy.services.mapper.GoodsMapper;
import com.lmy.services.service.GoodsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("goodsService")
@Transactional
public class GoodsServiceImpl implements GoodsService {
    private GoodsMapper goodsMapper;

    public GoodsServiceImpl(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }
    @Override
    public List<Goods> getMyOrder(Integer userId) {
        return goodsMapper.getMyOrder(userId);
    }

    @Override
    public List<Goods> getSellOrder(Integer userId) {
        return goodsMapper.getSellOrder(userId);
    }

    @Override
    public Goods getGoodsByGoodsId(Integer userId, Integer goodsId) {
        return goodsMapper.getGoodsByGoodsId(userId,goodsId);
    }

    @Override
    public Integer addResale(Goods goods) {
        return goodsMapper.addResale(goods);
    }

    @Override
    public Integer upOrDown(Integer goodsId) {
        return goodsMapper.upOrDown(goodsId);
    }

    @Override
    public Integer deleteGoods(Integer goodsId) {
        return goodsMapper.deleteGoods(goodsId);
    }

    @Override
    public List<Goods> getResaleList(Integer userId) {
        return goodsMapper.getResaleList(userId);
    }

    @Override
    public List<Goods> getBuyList(Integer userId) {
        return goodsMapper.getBuyList(userId);
    }

    @Override
    public List<Goods> getMyResaleList(Integer userId) {
        return goodsMapper.getMyResaleList(userId);
    }

    @Override
    public List<Goods> getMyBuyList(Integer userId) {
        return goodsMapper.getMyBuyList(userId);
    }

    @Override
    public Integer updateGoodsInfo(Goods goods) {
        return goodsMapper.updateGoodsInfo(goods);
    }

    @Override
    public List<Goods> getCollectedGoodsByUserId(Integer userId) {
        return goodsMapper.getCollectedGoodsByUserId(userId);
    }

    @Override
    public Integer collectGoods(Integer userId, Integer goodsId) {
        return goodsMapper.collectGoods(userId, goodsId);
    }

    @Override
    public Integer cancelCollectGoods(Integer userId, Integer goodsId) {
        return goodsMapper.cancelCollectGoods(userId, goodsId);
    }

    @Override
    public Integer addOrder(Integer goodsId, Integer buyer) {
        int result1 = goodsMapper.addOrder(goodsId, buyer);
        int result2 = goodsMapper.updateGoodsStatus(goodsId);
        return (result1 > 0 && result2 > 0) ? 1 : 0;
    }

    @Override
    public Integer updateSaleOrNot(Integer goodsId) {
        return goodsMapper.updateSaleOrNot(goodsId);
    }

    @Override
    public List<Goods> searchGoods(Integer askId, String key) {
        return goodsMapper.searchGoods(askId, key);
    }

    @Override
    public List<Goods> getGoodsById(Integer userId) {
        return goodsMapper.getGoodsById(userId);
    }
}
