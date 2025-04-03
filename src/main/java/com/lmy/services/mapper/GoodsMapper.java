package com.lmy.services.mapper;

import com.lmy.services.entity.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsMapper {

    @Insert("insert into goods (userId,type,goodsName,goodsDesc,goodsPrice,image,createTime) " +
            "values (#{userId},#{type},#{goodsName},#{goodsDesc},#{goodsPrice},#{image},#{createTime})")
    Integer addResale(Goods goods);


    @Update("UPDATE goods " +
            "SET status = CASE " +
            "   WHEN status = '0' THEN '1' " +
            "   ELSE '0' " +
            "END " +
            "WHERE goodsId = #{goodsId}")
    Integer upOrDown(Integer goodsId);

    @Delete("DELETE FROM goods WHERE goodsId = #{goodsId}")
    Integer deleteGoods(Integer goodsId);



    @Select("SELECT *, #{userId} AS askId FROM goods WHERE type = '0' AND status = '0' ORDER BY goodsId DESC")
    @Results(id = "goodsMap", value = {
            @Result(id = true, property = "goodsId", column = "goodsId"),
            @Result(property = "userId", column = "userId"),
            @Result(property = "isCollected", column = "{askId=askId,goodsId=goodsId}",
                    one = @One(select = "com.lmy.services.mapper.GoodsMapper.isCollected")),
            @Result(property = "username", column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
    })
    List<Goods> getResaleList(Integer userId);

    @Select("SELECT * ,#{userId} as askId FROM goods WHERE goodsId = #{goodsId}")
    @ResultMap("goodsMap")
    Goods getGoodsByGoodsId(@Param("userId") Integer userId, @Param("goodsId") Integer goodsId);

    @Select("SELECT *, #{userId} AS askId FROM goods WHERE type = '1' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getBuyList(Integer userId);


    @Select("SELECT *, #{userId} AS askId FROM goods WHERE userId = #{userId} AND type = '0' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getMyResaleList(Integer userId);

    @Select("SELECT *, #{userId} AS askId FROM goods WHERE userId = #{userId} AND type = '1' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getMyBuyList(Integer userId);

    @Select("SELECT *, #{userId} AS askId FROM goods WHERE userId = #{userId} ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getMyGoods(Integer userId);

    @Update("""
        UPDATE goods
        SET
            type=#{type},
            goodsName = #{goodsName},
            goodsDesc = #{goodsDesc},
            goodsPrice = #{goodsPrice},
            image = #{image}
        WHERE goodsId = #{goodsId}
    """)
    int updateGoodsInfo(Goods goods);

    @Update("UPDATE goods SET status = CASE WHEN status = '0' THEN '1' ELSE '0' END WHERE goodsId = #{goodsId}")
    Integer updateSaleOrNot(Integer goodsId);


    @Select("""
        SELECT *,#{userId} as askId
        FROM goods g
        JOIN collectgoods c ON g.goodsId = c.goodsId
        WHERE c.userId = #{userId}
    """)
    @ResultMap("goodsMap")
    List<Goods> getCollectedGoodsByUserId(int userId);

    // 收藏商品
    @Insert("INSERT IGNORE INTO collectgoods (userId, goodsId) VALUES (#{userId}, #{goodsId})")
    Integer collectGoods(Integer userId, Integer goodsId);

    //取消收藏
    @Delete("DELETE FROM collectgoods WHERE userId = #{userId} AND goodsId = #{goodsId}")
    Integer cancelCollectGoods(Integer userId, Integer goodsId);

    // 获取我的订单
    @Select("SELECT o.orderId, o.createTime, g.* FROM goodsorder o JOIN goods g ON o.goodsId = g.goodsId WHERE o.userId = #{userId}")
    @ResultMap("goodsMap")
    List<Goods> getMyOrder(@Param("userId") Integer userId);

    // 获取我的售出订单
    @Select("SELECT g.*, gr.orderId, gr.createTime AS sellTime FROM goodsorder AS gr LEFT JOIN goods AS g ON g.goodsId = gr.goodsId WHERE g.userId = #{userId}")
    @ResultMap("goodsMap")
    List<Goods> getSellOrder(@Param("userId") Integer userId);

    // 判断某个用户是否收藏了某个商品
    @Select("SELECT COUNT(*) FROM collectgoods WHERE userId = #{askId} AND goodsId = #{goodsId}")
    Integer isCollected(@Param("askId") Integer askId, @Param("goodsId") Integer goodsId);

    // 模糊搜索商品
    @Select("SELECT *, #{askId} AS askId FROM goods WHERE goodsName LIKE CONCAT('%',#{key},'%') ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> searchGoods(@Param("askId") Integer askId, @Param("key") String key);


    // 添加订单
    @Insert("INSERT INTO goodsorder (goodsId, buyer) VALUES (#{goodsId}, #{buyer} )")
    Integer addOrder(@Param("goodsId") Integer goodsId, @Param("buyer") Integer buyer);

}
