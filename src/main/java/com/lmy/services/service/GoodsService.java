package com.lmy.services.service;

import com.lmy.services.entity.Goods;

import java.util.List;

public interface GoodsService {

    Goods getGoodsByGoodsId( Integer userId, Integer goodsId);

    Integer addResale(Goods goods);

    Integer upOrDown(Integer goodsId);

    Integer deleteGoods(Integer goodsId);

    List<Goods> getResaleList(Integer userId);

    List<Goods> getBuyList(Integer userId);

    List<Goods> getMyResaleList(Integer userId);

    List<Goods> getMyBuyList(Integer userId);

    Integer updateGoodsInfo(Goods goods);

    List<Goods> getCollectedGoodsByUserId(Integer userId);

    Integer collectGoods(Integer userId, Integer goodsId);

    Integer cancelCollectGoods(Integer userId, Integer goodsId);

    List<Goods> getMyOrder(Integer userId);
    //查询出售订单
    List<Goods> getSellOrder(Integer userId);

    Integer addOrder(Integer goodsId, Integer buyer);

    Integer updateSaleOrNot(Integer goodsId);

    List<Goods> searchGoods(Integer askId, String key);

    List<Goods> getMyGoods(Integer userId);
}
