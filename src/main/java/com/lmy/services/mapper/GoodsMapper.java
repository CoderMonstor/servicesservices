package com.lmy.services.mapper;

import com.lmy.services.entity.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsMapper {

    @Insert("insert into goods (userId,categoryId,type,goodsName,goodsDesc,goodsPrice,image,status,sellStatus,createTime,address) " +
            "values (#{userId},#{categoryId},#{type},#{goodsName},#{goodsDesc},#{goodsPrice},#{image},#{status},#{sellStatus},#{createTime},#{address})")
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



    // 核心映射：一个 Goods 关联用户昵称、分类名、收藏状态等
    @Select("SELECT *, #{askId} AS askId FROM goods WHERE type = '0' AND status = '0' ORDER BY goodsId DESC")
    @Results(id = "goodsMap", value = {
            @Result(id = true, property = "goodsId", column = "goodsId"),
            @Result(property = "userId", column = "userId"),
            @Result(property = "categoryId", column = "categoryId"),
            @Result(property = "username", column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
    })
    List<Goods> getResaleList(Integer askId);


    @Select("SELECT * FROM goods WHERE goodsId = #{goodsId}")
    Goods getGoodsByGoodsId(Integer goodsId);


    @Select("SELECT *, #{userId} AS askId FROM goods WHERE type = '1' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getBuyList(Integer userId);


    @Select("SELECT *, #{userId} AS askId FROM goods WHERE userId = #{userId} AND type = '0' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getMyResaleList(Integer userId);

    @Select("SELECT *, #{userId} AS askId FROM goods WHERE userId = #{userId} AND type = '1' ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getMyBuyList(Integer userId);

    @Update("""
        UPDATE goods
        SET
            goodsName = #{goodsName},
            goodsDesc = #{goodsDesc},
            goodsPrice = #{goodsPrice},
            address = #{address},
            image = #{image}
        WHERE goodsId = #{goodsId}
    """)
    int updateGoodsInfo(Goods goods);

    @Update("UPDATE goods SET sellStatus = CASE WHEN sellStatus = '0' THEN '1' ELSE '0' END WHERE goodsId = #{goodsId}")
    Integer updateSaleOrNot(Integer goodsId);

    @Select("""
        SELECT g.*
        FROM goods g
        JOIN collectgoods c ON g.goodsId = c.goodsId
        WHERE c.userId = #{userId}
    """)
    List<Goods> getCollectedGoodsByUserId(int userId);

    // 收藏商品
    @Insert("INSERT INTO collectgoods (userId, goodsId) VALUES (#{userId}, #{goodsId})")
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

    // 根据分类查商品
    @Select("SELECT *, #{askId} AS askId FROM goods WHERE categoryId = #{categoryId} ORDER BY goodsId DESC")
    @ResultMap("goodsMap")
    List<Goods> getGoodsByCategory(@Param("askId") Integer askId, @Param("categoryId") Integer categoryId);

    // 添加订单
    @Insert("INSERT INTO goodsorder (goodsId, buyer) VALUES (#{goodsId}, #{buyer} )")
    Integer addOrder(@Param("goodsId") Integer goodsId, @Param("buyer") Integer buyer);

}
