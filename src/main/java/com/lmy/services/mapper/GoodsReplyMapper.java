package com.lmy.services.mapper;

import com.lmy.services.entity.GoodsReply;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsReplyMapper {
    @Select("SELECT * ,#{askId} as askId FROM goodsReply WHERE commentId = #{commentId} order by replyId DESC")
    @Results(id = "replyMap",value = {
            @Result(id = true,property = "replyId",column = "replyId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "avatarUrl",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getAvatarById")),
            @Result(property = "username",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
    })
    List<GoodsReply> getReplyByCommentId(Integer askId, Integer commentId);

    @Select("SELECT * ,#{askId} as askId FROM goodsReply WHERE commentId = #{commentId} order by replyId DESC LIMIT 2")
    @ResultMap("replyMap")
    List<GoodsReply> getTopReplyByCommentId(Integer askId, Integer commentId);

    //添加回复
    @Insert("insert into goodsReply (userId,commentId,text,imageUrl,date,beReplyName) " +
            "values(#{userId},#{commentId},#{text},#{imageUrl},#{date},#{beReplyName}) ")
    Integer addReply(GoodsReply reply);
    //删除回复
    @Delete("delete from goodsReply where replyId = #{replyId}")
    Integer deleteReply(Integer replyId);
}
