package com.lmy.services.mapper;

import com.lmy.services.entity.GoodsComment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsCommentMapper {
    //根据postId查询其所有的评论
    @Select("SELECT * ,#{askId} as askId FROM goodsComment WHERE goodsId = #{goodsId} order by commentId DESC")
    @Results(id = "goodsCommentMap",value = {
            @Result(id = true,property = "commentId",column = "commentId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "avatarUrl",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getAvatarById")),
            @Result(property = "username",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
            @Result(property = "replyNum",column = "commentId",
                    one = @One(select = "com.lmy.services.mapper.GoodsCommentMapper.getReplyNumByCommentId")),
            @Result(property="goodsReplyList",column = "{askId = askId,commentId = commentId}",
                    many = @Many(select = "com.lmy.services.mapper.GoodsReplyMapper.getTopReplyByCommentId"))
    })
    List<GoodsComment> getCommentByGoodsId(Integer askId, Integer goodsId);

    //添加评论
    @Insert("insert into goodsComment (userId,goodsId,imageUrl,text,date) " +
            "values(#{userId},#{goodsId},#{imageUrl},#{text},#{date}) ")
    Integer addComment(GoodsComment comment);
    //删除评论
    @Delete("delete from goodsComment where commentId = #{commentId}")
    Integer deleteComment(Integer commentId);
    @Select("select count(*) as replyNum from goodsReply where commentId = #{commentId}")
    Integer getReplyNumByCommentId(Integer commentId);
}
