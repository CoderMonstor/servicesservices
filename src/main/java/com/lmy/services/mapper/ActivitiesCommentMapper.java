package com.lmy.services.mapper;

import com.lmy.services.entity.Discuss;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 评论：Mapper接口
 *
 */
@Repository
public interface ActivitiesCommentMapper {
    @Select("SELECT * FROM discuss WHERE activityId = #{activityId} ORDER BY createTime DESC")
    List<Discuss> getCommentsByActivityId(@Param("activityId") int activityId);

    /**
     * 添加评论
     */
    @Insert("INSERT INTO discuss (userId, activityId, replyId, parentId, content) " +
            "VALUES (#{userId}, #{activityId}, #{replyId}, #{parentId}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "discussId") // 返回自增ID
    int addComment(Discuss discuss);

    /**
     * 删除评论（物理删除）
     */
    @Delete("DELETE FROM discuss WHERE discussId = #{discussId} OR replyId = #{discussId}")
    int deleteComment(@Param("discussId") int discussId);

    /**
     * 回复评论（插入新的回复）
     */
    @Insert("INSERT INTO discuss (userId, activityId, replyId, parentId, content ) " +
            "VALUES (#{userId}, #{activityId}, #{replyId}, #{parentId}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "discussId") // 返回自增ID
    int replyComment(Discuss discuss);

    @Select("SELECT * FROM discuss WHERE activityId = #{activityId} AND parentId = 0 ORDER BY createTime DESC")
    List<Discuss> getMainComments(@Param("activityId") int activityId);

    /**
     * 递归查询某条评论的所有子评论
     */
    @Select("SELECT * FROM discuss WHERE parentId = #{parentId} ORDER BY createTime ASC")
    List<Discuss> getChildComments(@Param("parentId") int parentId);
}
