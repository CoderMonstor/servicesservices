package com.lmy.services.mapper;

import com.lmy.services.entity.Activities;
import com.lmy.services.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivitiesMapper {
    String BASE_SELECT = """
    SELECT 
        a.*,  
        (SELECT CAST(COUNT(*) AS SIGNED) FROM registration WHERE activityId = a.activityId) AS currentParticipants,
        (CASE WHEN EXISTS (
            SELECT 1 FROM registration r 
            WHERE r.userId = #{userId} AND r.activityId = a.activityId 
        ) THEN CAST(1 AS SIGNED) ELSE CAST(0 AS SIGNED) END) AS isRegistered,
        (CASE WHEN EXISTS (
            SELECT 1 FROM praise p
            WHERE p.userId = #{userId} AND p.activityId = a.activityId
        ) THEN CAST(1 AS SIGNED) ELSE CAST(0 AS SIGNED) END) AS isPraised
    FROM activities a 
    """;

    // 添加活动
    @Insert("""
        INSERT INTO activities (hostUserId, activityName, activityImage, activityTime, location, maxParticipants, details) 
        VALUES (#{hostUserId}, #{activityName}, #{activityImage}, #{activityTime}, #{location}, #{maxParticipants}, #{details})
    """)
    Integer addActivities(Activities activities);

    // 删除活动
    @Delete("DELETE FROM activities WHERE activityId = #{activityId}")
    Integer deleteActivities(Integer activityId);

    @Select(BASE_SELECT + " ORDER BY a.activityTime DESC")
    @Results(id = "activityMap", value = {
            @Result(id = true, column = "activityId", property = "activityId"),
            @Result(property = "currentParticipants", column = "currentParticipants"),
            @Result(property = "isRegistered", column = "isRegistered"),
            @Result(property = "isPraised", column = "isPraised")
    })
    List<Activities> getActivityInfo(@Param("userId") Integer userId);

    @Select(BASE_SELECT + " WHERE a.activityId = #{activityId}")
    @ResultMap("activityMap")
    Activities getActivityDetail(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    @Select(BASE_SELECT + " WHERE a.hostUserId = #{userId} ORDER BY a.activityTime DESC")
    @ResultMap("activityMap")
    List<Activities> getActivitiesByUser(@Param("userId") Integer userId);

    @Select(BASE_SELECT + " WHERE a.status = 1 ORDER BY a.activityTime DESC")
    @ResultMap("activityMap")
    List<Activities> getAllActivities(@Param("userId") Integer userId);

    // 搜索活动
    @Select(BASE_SELECT + """
        WHERE a.activityName LIKE CONCAT('%', #{key}, '%')
           OR a.location LIKE CONCAT('%', #{key}, '%')
           OR a.details LIKE CONCAT('%', #{key}, '%')
        ORDER BY a.activityTime DESC
    """)
    @ResultMap("activityMap")
    List<Activities> searchActivities(@Param("userId") Integer userId, @Param("key") String key);

    // 更新活动
    @Update("""
        UPDATE activities 
        SET activityName = #{activityName}, 
            activityImage = #{activityImage}, 
            activityTime = #{activityTime}, 
            location = #{location}, 
            maxParticipants = #{maxParticipants}, 
            details = #{details}, 
            status = #{status} 
        WHERE activityId = #{activityId}
    """)
    Integer updateActivities(Activities activities);

    // 修改活动状态
    @Update("UPDATE activities SET status = #{status} WHERE activityId = #{activityId}")
    Integer changeStatus(@Param("activityId") Integer activityId, @Param("status") Integer status);

    // 收藏活动
    @Insert("INSERT INTO collectActivity (userId, activityId) VALUES (#{userId}, #{activityId})")
    Integer collectActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 取消收藏
    @Delete("DELETE FROM collectActivity WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer cancelCollectActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 获取点赞数
    @Select("SELECT COUNT(*) FROM praise WHERE activityId = #{activityId}")
    Integer getPraiseCount(Integer activityId);

    // 获取收藏数
    @Select("SELECT COUNT(*) FROM collectActivity WHERE activityId = #{activityId}")
    Integer getCollectCount(Integer activityId);

    // 报名活动
    @Insert("INSERT INTO registration (userId, activityId) VALUES (#{userId}, #{activityId})")
    Integer registerActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 取消报名
    @Delete("DELETE FROM registration WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer cancelRegistration(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 查询是否报名
    @Select("SELECT count(*) FROM registration WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer getRegistrationStatus(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 当前报名人数
    @Select("SELECT count(*) FROM registration WHERE activityId = #{activityId}")
    Integer getCurrentParticipants(@Param("activityId") Integer activityId);

    // 获取参与用户列表
    @Select("""
        SELECT u.userId, u.username, u.avatarUrl
        FROM user u  
        INNER JOIN registration r ON u.userId = r.userId  
        WHERE r.activityId = #{activityId} AND r.status = 1
        ORDER BY r.createTime DESC
    """)
    @Results({
            @Result(property = "userId", column = "userId", id = true),
            @Result(property = "username", column = "username"),
            @Result(property = "avatarUrl", column = "avatarUrl")
    })
    List<User> getActivityParticipants(@Param("activityId") Integer activityId);

    // 点赞活动
    @Insert("INSERT INTO praise (userId, activityId) VALUES (#{userId}, #{activityId})")
    Integer praiseActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    // 取消点赞
    @Delete("DELETE FROM praise WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer cancelPraiseActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

        @Select(BASE_SELECT + """
        INNER JOIN praise p ON a.activityId = p.activityId
        WHERE p.userId = #{userId}
        ORDER BY a.activityTime DESC
    """)
    @ResultMap("activityMap")
    List<Activities> getMyStarActivities(@Param("userId") Integer userId);
    @Select(BASE_SELECT + """
        INNER JOIN collectActivity c ON a.activityId = c.activityId
        WHERE c.userId = #{userId}
        ORDER BY a.activityTime DESC
    """)
    @ResultMap("activityMap")
    List<Activities> getMyCollectedActivities(@Param("userId") Integer userId);

    @Select(BASE_SELECT + " WHERE EXISTS (SELECT 1 FROM registration r WHERE r.userId = #{userId} AND r.activityId = a.activityId)")
    List<Activities> getActivitiesRegistered(@Param("userId") Integer userId);

    @Update("UPDATE activities SET status = 0 WHERE activityId = #{activityId}")
    Integer cancelActivity(Integer activityId);
}
