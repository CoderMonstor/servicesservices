package com.lmy.services.mapper;

import com.lmy.services.entity.Discuss;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface DiscussMapper {
    @Select("SELECT d.*, u.username, u.avatarUrl, " +
            "       (SELECT COUNT(*) FROM discuss d2 WHERE d2.parentId = d.discussId) AS depth, " +
            "       (SELECT u2.username FROM discuss d3 " +
            "        JOIN user u2 ON d3.userId = u2.userId " +
            "        WHERE d3.discussId = d.replyId) AS replyTo " +
            "FROM discuss d " +
            "JOIN user u ON d.userId = u.userId " +
            "WHERE d.activityId = #{activityId} " +
            "ORDER BY d.createTime DESC")
    List<Discuss> getCommentsByActivityId(@Param("activityId") int activityId);

    /**
     * 添加评论
     */
    @Insert("INSERT INTO discuss (userId, activityId, replyId, parentId, content) " +
            "VALUES (#{userId}, #{activityId}, #{replyId}, #{parentId}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "discussId") // 返回自增ID
    Integer addComment(Discuss discuss);

    /**
     * 删除评论（物理删除）
     */
    @Delete("DELETE FROM discuss WHERE discussId = #{discussId} OR replyId = #{discussId}")
    Integer deleteComment(@Param("discussId") int discussId);

    /**
     * 回复评论（插入新的回复）
     */

    @Insert("INSERT INTO discuss (userId, activityId, replyId, parentId, content ) " +
            "VALUES (#{userId}, #{activityId}, #{replyId}, #{parentId}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "discussId") // 返回自增ID
    int replyComment(Discuss discuss);

    @Select("SELECT d.*, u.username, u.avatarUrl, " +
            "       (SELECT COUNT(*) FROM discuss d2 WHERE d2.parentId = d.discussId) AS depth, " +
            "       NULL AS replyTo " +
            "FROM discuss d " +
            "JOIN user u ON d.userId = u.userId " +
            "WHERE d.activityId = #{activityId} AND d.parentId = 0 " +
            "ORDER BY d.createTime DESC")
    List<Discuss> getMainComments(@Param("activityId") int activityId);

    /**
     * 递归查询某条评论的所有子评论
     */
    @Select("SELECT d.*, u.username, u.avatarUrl, " +
            "       (SELECT COUNT(*) FROM discuss d2 WHERE d2.parentId = d.discussId) AS depth, " +
            "       (SELECT u2.username FROM discuss d3 " +
            "        JOIN user u2 ON d3.userId = u2.userId " +
            "        WHERE d3.discussId = d.replyId) AS replyTo " +
            "FROM discuss d " +
            "JOIN user u ON d.userId = u.userId " +
            "WHERE d.parentId = #{parentId} " +
            "ORDER BY d.createTime ASC")
    List<Discuss> getChildComments(@Param("parentId") int parentId);
    // 获取完整的评论树（包含层级信息）
    @Select("""
    WITH RECURSIVE comment_tree AS (
        SELECT 
            d.discussId,
            d.parentId,
            d.replyId,
            0 AS depth,
            d.createTime,
            /* 主评论时间戳格式化（精确到秒） */
            CAST(DATE_FORMAT(d.createTime, '%Y%m%d%H%i%s') AS sort_time,
            CAST(d.discussId AS CHAR(255)) AS sort_path
        FROM discuss d
        WHERE d.activityId = #{activityId} AND d.parentId = 0
        
        UNION ALL
        
        SELECT 
            c.discussId,
            c.parentId,
            c.replyId,
            ct.depth + 1,
            c.createTime,
            /* 继承主评论时间保持整体排序 */
            ct.sort_time,
            /* 子评论路径=主路径+时间戳（补齐17位） */
            CONCAT(
                ct.sort_path, 
                '-', 
                LPAD(DATE_FORMAT(c.createTime, '%Y%m%d%H%i%s'), 17, '0')
            )
        FROM discuss c
        JOIN comment_tree ct ON c.parentId = ct.discussId
        WHERE c.activityId = #{activityId}
    )
    SELECT 
        ct.*,
        u.username,
        u.avatarUrl,
        COALESCE(
            (SELECT u2.username 
             FROM discuss d3 
             JOIN user u2 ON d3.userId = u2.userId 
             WHERE d3.discussId = ct.replyId AND ct.replyId > 0),
            ''
        ) AS replyTo
    FROM comment_tree ct
    JOIN user u ON ct.userId = u.userId
    ORDER BY 
        ct.sort_time DESC,  
        ct.sort_path ASC  
""")
    List<Discuss> getCommentTreeByActivityId(@Param("activityId") int activityId);

    // 通用评论插入方法
    @Insert("INSERT INTO discuss (userId, activityId, replyId, parentId, content) " +
            "VALUES (#{userId}, #{activityId}, #{replyId}, #{parentId}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "discussId")
    int insertComment(Discuss discuss);

    // 级联删除评论及其子评论
    @Delete("""
        DELETE FROM discuss 
        WHERE discussId IN (
            WITH RECURSIVE comment_branch AS (
                SELECT discussId 
                FROM discuss 
                WHERE discussId = #{discussId}
                
                UNION ALL
                
                SELECT d.discussId 
                FROM discuss d
                JOIN comment_branch cb ON d.parentId = cb.discussId
            )
            SELECT discussId FROM comment_branch
        )
    """)
    int deleteCommentTree(@Param("discussId") int discussId);

    // 获取单个评论详情
    @Select("""
        SELECT d.*, u.username, u.avatarUrl,
            (SELECT COUNT(*) FROM discuss WHERE parentId = d.discussId) AS depth,
            COALESCE(
                (SELECT u2.username 
                 FROM discuss d3 
                 JOIN user u2 ON d3.userId = u2.userId 
                 WHERE d3.discussId = d.replyId AND d.replyId > 0),
                ''
            ) AS replyTo
        FROM discuss d
        JOIN user u ON d.userId = u.userId
        WHERE d.discussId = #{discussId}
    """)
    Optional<Discuss> getCommentById(@Param("discussId") int discussId);
}
