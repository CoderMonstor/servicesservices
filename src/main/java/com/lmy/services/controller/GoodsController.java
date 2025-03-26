package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Goods;
import com.lmy.services.service.GoodsService;
import com.lmy.services.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/goods")
public class GoodsController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private GoodsService goodsService;

    //发布
    @RequestMapping("/addResale")
    public Result<Integer> addResale(Goods goods){
        System.out.println("------------------------------------------------------------------");
        System.out.println(goods.getType());
        Result<Integer> json;
        try {
            Integer res= goodsService.addResale(goods);
            json = new Result<>("1","发布成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","发布失败");
        }
        return json;
    }
    //上架下架
    @RequestMapping("/upOrDown")
    public Result<Integer> upOrDown(Integer goodsId){
        Result<Integer> json;
        try {
            Integer res = goodsService.upOrDown(goodsId);
            json = new Result<>("1","操作成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","操作失败");
        }
        return json;
    }
    //售出/已售
    @RequestMapping("/updateSaleOrNot")
    public Result<Integer> updateSaleOrNot(Integer goodsId){
        Result<Integer> json;
        try {
            Integer res = goodsService.updateSaleOrNot(goodsId);
            json = new Result<>("1","操作成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","操作失败");
        }
        return json;
    }

    @RequestMapping("/searchGoods")
    public Result<List<Goods>> searchGoods(Integer askId,String key,Integer page){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.searchGoods(askId, key);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到商品信息",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getGoodsByGoodsId")
    public Result<Goods> getGoodsByGoodsId(Integer goodsId){
        Result<Goods> json;
        try {
            Goods res = goodsService.getGoodsByGoodsId(goodsId);
            json = new Result<>(res,"1","获取到商品信息");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>(null,"0","获取商品信息失败");
        }
        return json;
    }
    //删除
    @RequestMapping("/deleteGoods")
    public Result<Integer> deleteGoods(Integer goodsId){
        Result<Integer> json;
        try {
            Integer res = goodsService.deleteGoods(goodsId);
            json = new Result<>("1","删除成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","删除失败");
        }
        return json;
    }

     //闲置列表查询
    @RequestMapping("/getResaleList")
    public Result<List<Goods>> getResaleList(Integer userId,Integer page){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.getResaleList(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到闲置列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

     //求购列表查询
    @RequestMapping("/getBuyList")
    public Result<List<Goods>> getBuyList(Integer userId,Integer page){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.getBuyList(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到求购列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }


    //我发布的闲置
    @RequestMapping("/getMyResaleList")
    public Result<List<Goods>> getMyResaleList(Integer userId,Integer page){
        PageHelper.startPage(page, 10);
        List<Goods> res=goodsService.getMyResaleList(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到闲置列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }
    //我发布的求购
    @RequestMapping("/getMyBuyList")
    public Result<List<Goods>> getMyBuyList(Integer userId,Integer page){
        PageHelper.startPage(page, 10);
        List<Goods> res=goodsService.getMyBuyList(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到求购列表",pageInfo.getPages())
                :new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    //编辑
    @RequestMapping("/edit")
    public Result<Integer> updateGoodsInfo(Goods goods){
        Result<Integer> json;
        try {
            Integer res= goodsService.updateGoodsInfo(goods);
            json = new Result<>("1","编辑成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","编辑失败");
        }
        return json;
    }

    //根据 userId 查询该用户收藏的商品
    @RequestMapping("/getCollectedGoodsByUserId")
    public Result<List<Goods>> getCollectedGoodsByUserId(Integer page, Integer userId){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.getCollectedGoodsByUserId(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到收藏商品列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }
    //收藏商品
    @RequestMapping("/collectGoods")
    public Result<Integer> collectGoods(Integer userId,Integer goodsId){
        Result<Integer> json;
        try {
            Integer res = goodsService.collectGoods(userId,goodsId);
            json = new Result<>("1","收藏成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","收藏失败");
        }
        return json;
    }
    //取消收藏
    @RequestMapping("/cancelCollectGoods")
    public Result<Integer> cancelCollectGoods(Integer userId,Integer goodsId){
        Result<Integer> json;
        try {
            Integer res = goodsService.cancelCollectGoods(userId,goodsId);
            json = new Result<>("1","取消收藏成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","取消收藏失败");
        }
        return json;
    }

    @RequestMapping("/getMyOrder")
    public Result<List<Goods>> getMyOrder(Integer page,Integer userId){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.getMyOrder(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到订单列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getSellOrder")
    public Result<List<Goods>> getSellOrder(Integer page,Integer userId){
        PageHelper.startPage(page, 10);
        List<Goods> res = goodsService.getSellOrder(userId);
        PageInfo<Goods> pageInfo = new PageInfo<>(res);
        Result<List<Goods>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到订单列表",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/addOrder")
    public Result<Integer> addOrder(Integer goodsId,Integer buyer){
        Result<Integer> json;
        try {
            Integer res = goodsService.addOrder(goodsId,buyer);
            json = new Result<>("1","添加成功");
        }catch (Exception e){
            logger.warn(e.toString());
            json = new Result<>("0","添加失败");
        }
        return json;
    }


}
