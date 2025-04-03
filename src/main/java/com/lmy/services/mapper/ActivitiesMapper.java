package com.lmy.services.mapper;

import com.lmy.services.entity.Activities;
import com.lmy.services.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivitiesMapper {
    @Insert("INSERT INTO activities (hostUserId, activityName, activityImage, activityTime, location, maxParticipants,  details) " +
            "VALUES (#{hostUserId}, #{activityName}, #{activityImage}, #{activityTime}, #{location}, #{maxParticipants}, #{details}, )")
    Integer addActivities(Activities activities);

    @Delete("DELETE FROM activities WHERE activityId = #{activityId}")
    Integer deleteActivities(Integer activityId);

    @Select("SELECT * FROM activities WHERE activityId = #{activityId}")
    @Results(id = "activitiesMap", value = {
            @Result(id = true, property = "activityId", column = "activityId"),
            @Result(property = "isRegistered",column = "{userId=userId,activityId=activityId}",
                    one = @One(select = "com.lmy.services.mapper.ActivitiesMapper.getRegistrationStatus")
            )
    })
    Activities getActivitiesById(@Param("askId") Integer userId, @Param("activityId") Integer activityId);

    @Select("""
        SELECT 
            a.*, 
            #{userId} AS queryUserId 
        FROM activities a 
        WHERE a.activityId = #{activityId}
    """)
    @Results(id = "activityMap", value = {
            @Result(id = true, column = "activityId", property = "activityId"),
            @Result(column = "hostUserId", property = "hostUserId"),
            @Result(
                    property = "isRegistered",
                    column = "{userId=queryUserId, activityId=activityId}",
                    one = @One(select = "com.lmy.services.mapper.ActivitiesMapper.getRegistrationStatus")
            )
    })
    Activities getActivityDetail(
            @Param("userId") Integer userId,
            @Param("activityId") Integer activityId
    );

    @Select("SELECT * FROM activities WHERE hostUserId = #{userId}")
    List<Activities> getActivitiesByUser(Integer userId);

    @Insert("INSERT INTO collectActivity (userId, activityId) VALUES (#{userId}, #{activityId})")
    Integer collectActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    @Delete("DELETE FROM collectActivity WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer canselCollectActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    @Select("SELECT * FROM activities WHERE status = 1")
    List<Activities> getAllActivities(@Param("askId") Integer askId);

    @Select("""
    SELECT 
        activityId, activityName, activityImage, 
        activityTime, location, status 
    FROM activities 
    WHERE 
        MATCH(activityName, location, details) 
        AGAINST(#{key} IN NATURAL LANGUAGE MODE)
    """)
    List<Activities> searchActivities(@Param("askId") Integer askId, @Param("key") String key);

    @Update("UPDATE activities SET activityName=#{activityName}, activityImage=#{activityImage}, activityTime=#{activityTime}, location=#{location}, " +
            "maxParticipants=#{maxParticipants}, content=#{content}, details=#{details}, hits=#{hits}, praiseCount=#{praiseCount}, status=#{status} " +
            "WHERE activityId=#{activityId}")
    Integer updateActivities(Activities activities);

    @Update("UPDATE activities SET status = #{status} WHERE activityId = #{activityId}")
    Integer changeStatus(@Param("activityId") Integer activityId, @Param("status") Integer status);

    @Select("SELECT COUNT(*) FROM praise WHERE activityId = #{activityId}")
    Object getPraiseCount(Integer activityId);

    @Select("SELECT COUNT(*) FROM collectActivity WHERE activityId = #{activityId}")
    Object getCollectCount(Integer activityId);

    @Insert("INSERT INTO registration (userId, activityId, status) VALUES (#{userId}, #{activityId},1)")
    Integer registerActivity(@Param("userId") Integer userId, @Param("activityId") Integer activityId);

    @Delete("DELETE FROM registration WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer cancelRegistration(Integer userId, Integer activityId);

    @Select("SELECT count(*) FROM registration WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer getRegistrationStatus(Integer userId, Integer activityId);

    @Select("""
            SELECT
            u.userId, 
            u.username, 
            u.avatarUrl
            FROM user u  
            INNER JOIN registration r ON u.userid = r.userId  
            WHERE r.activityId = #{activityId}
            AND r.status = 1
            ORDER BY r.createTime DESC
        """)
    @Results({
            @Result(property = "userId", column = "userId", id = true),
            @Result(property = "username", column = "username"),
            @Result(property = "avatarUrl", column = "avatarUrl"),
    })
    List<User> getActivityParticipants(@Param("activityId") Integer activityId);


    @Insert("INSERT INTO praise (userId, activityId) VALUES (#{userId}, #{activityId})")
    Integer priseActivity(Integer userId, Integer activityId);

    @Delete("DELETE FROM praise WHERE userId = #{userId} AND activityId = #{activityId}")
    Integer canselPraiseActivity(Integer userId, Integer activityId);
}
