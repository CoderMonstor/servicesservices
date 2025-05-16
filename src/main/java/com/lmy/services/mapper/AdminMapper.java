package com.lmy.services.mapper;

import com.lmy.services.entity.Admin;
import com.lmy.services.entity.Vo.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface AdminMapper {
    @Select("SELECT * FROM admin WHERE username = #{adminUsername}")
    Admin login(@Param("adminUsername") String adminUsername);

    @Delete("delete from user where userId = #{userId}")
    boolean deleteUser(Integer userId);
    @Select("SELECT * FROM user WHERE userId = #{userId}")
    List<AdminUser> findUserWithID(@Param("userId") Integer userId);

    @Select("SELECT * FROM user WHERE username = #{username}")
    List<AdminUser> findUserByUsername(@Param("username") String username);

    @Select("SELECT * FROM user WHERE username LIKE CONCAT('%', #{username}, '%')")
    List<AdminUser> findUserByUsernameFuzzy(@Param("username") String username);

    @Select("SELECT * FROM user WHERE userId = #{userId} AND username = #{username}")
    List<AdminUser> findUserByIdAndUsername(@Param("userId") Integer userId, @Param("username") String username);

    @Select("SELECT * FROM user WHERE userId = #{userId} AND username LIKE CONCAT('%', #{username}, '%')")
    List<AdminUser> findUserByIdAndUsernameFuzzy(@Param("userId") Integer userId, @Param("username") String username);

    @Select("SELECT * FROM user WHERE userId = #{userId}")
    @Results(id = "userMap",value = {
            @Result(id = true,property = "userId",column = "userId"),
            @Result(property = "postNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.AdminMapper.getPostNumById")),
            @Result(property = "fansNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.AdminMapper.getFanNumById")),
            @Result(property = "followNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.AdminMapper.getFollowNumById")),
            @Result(property = "goodsNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.AdminMapper.getGoodsNumById")),
            @Result(property = "activityNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.AdminMapper.getActivityNumById")),
    })
    UserDetail getUserById(Integer userId);
    @Update("UPDATE user SET password = 123456 WHERE userId = #{userId}")
    boolean resetPassword(Integer userId);
    @Update("UPDATE user SET username=#{username},email=#{email},avatarUrl=#{avatarUrl} WHERE userId = #{userId}")
    Integer updateUser(UserUpdate userUpdate);
    @Select("SELECT * FROM user")
    List<AdminUser> findAllUsers();
    @Select("SELECT COUNT(*) FROM post WHERE userId = #{userId}")
    Integer getPostNumById(Integer userId);
    @Select("select count(*) from fans where followedId = #{userId}")
    Integer getFanNumById(Integer userId);
    @Select("select count(*) from fans where fanId = #{userId}")
    Integer getFollowNumById(Integer userId);
    @Select("select count(*) from goods where userId = #{userId}")
    Integer getGoodsNumById(Integer userId);
    @Select("select count(*) from activities where hostUserId = #{userId}")
    Integer getActivityNumById(Integer userId);


    //=====================================================================================================================
    @Select("SELECT * FROM post")
    @Results(id = "postMap",value = {
            @Result(id = true,property = "postId",column = "postId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "username",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
            @Result(property = "date",column = "date"),
            @Result(property = "text",column = "text"),
            @Result(property = "imageUrl",column = "imageUrl"),
            @Result(property = "forwardId", column = "forwardId"),
            @Result(property = "likeNum",column = "postId",
                    one = @One(select = "com.lmy.services.mapper.PostMapper.getPostsLikeNum")),
            @Result(property = "forwardName",column = "forwardId",
                    one = @One(select = "com.lmy.services.mapper.PostMapper.getNameByPostId")),
            @Result(property = "forwardText",column = "forwardId",
                    one = @One(select = "com.lmy.services.mapper.PostMapper.getTextByPostId")),
            @Result(property = "forwardImageUrl",column = "forwardId",
                    one = @One(select = "com.lmy.services.mapper.PostMapper.getImageByPostId")),
    })
    List<AdminPost> findAllPosts();

    @Select("""
        SELECT p.* FROM post p
        JOIN user u ON p.userId = u.userId
        WHERE u.username LIKE CONCAT('%', #{username}, '%')
          AND p.text LIKE CONCAT('%', #{title}, '%')
          AND p.date BETWEEN #{startDate} AND #{endDate}
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostUTD(@Param("username") String username,
                               @Param("title") String title,
                               @Param("startDate") LocalDate startDate,
                               @Param("endDate") LocalDate endDate);

    @Select("""
        SELECT p.* FROM post p
        JOIN user u ON p.userId = u.userId
        WHERE u.username LIKE CONCAT('%', #{username}, '%')
          AND p.text LIKE CONCAT('%', #{title}, '%')
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostUT(@Param("username") String username,
                              @Param("title") String title);

    @Select("""
        SELECT p.* FROM post p
        JOIN user u ON p.userId = u.userId
        WHERE u.username LIKE CONCAT('%', #{username}, '%')
          AND p.date BETWEEN #{startDate} AND #{endDate}
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostUD(@Param("username") String username,
                              @Param("startDate") LocalDate startDate,
                              @Param("endDate") LocalDate endDate);

    @Select("""
        SELECT p.* FROM post p
        WHERE p.text LIKE CONCAT('%', #{title}, '%')
          AND p.date BETWEEN #{startDate} AND #{endDate}
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostTD(@Param("title") String title,
                              @Param("startDate") LocalDate startDate,
                              @Param("endDate") LocalDate endDate);

    @Select("""
        SELECT p.* FROM post p
        JOIN user u ON p.userId = u.userId
        WHERE u.username LIKE CONCAT('%', #{username}, '%')
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostU(@Param("username") String username);

    @Select("""
        SELECT p.* FROM post p
        WHERE p.text LIKE CONCAT('%', #{title}, '%')
    """)
    @ResultMap("postMap")
    List<AdminPost> getPostT(@Param("title") String title);

    @Select("""
    SELECT p.* FROM post p
    WHERE p.date BETWEEN #{startDate} AND #{endDate}
""")
    @ResultMap("postMap")
    List<AdminPost> getPostD(@Param("startDate") LocalDate startDate,
                             @Param("endDate") LocalDate endDate);


    @Delete("DELETE FROM post WHERE postId = #{postId}")
    Integer deletePost(int postId);

    @Select("SELECT * FROM goods")
    @Results(id = "goodsMap",value = {
            @Result(id = true,property = "goodsId",column = "goodsId"),
            @Result(property = "username",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),

    })
    List<AdminGoods> getAllGoods();

    @Select("SELECT * FROM goods WHERE goodsName LIKE CONCAT('%', #{goodsName}, '%') AND goodsDesc LIKE CONCAT('%', #{goodsDesc}, '%')")
    @ResultMap("goodsMap")
    List<AdminGoods> getGoodsND(String goodsName, String goodsDesc);

    @Select("SELECT * FROM goods WHERE goodsName LIKE CONCAT('%', #{goodsName}, '%')")
    @ResultMap("goodsMap")
    List<AdminGoods> getGoodsN(String goodsName);

    @Select("SELECT * FROM goods WHERE goodsDesc LIKE CONCAT('%', #{goodsDesc}, '%')")
    @ResultMap("goodsMap")
    List<AdminGoods> getGoodsByD(String goodsDesc);


    @Delete("DELETE FROM goods WHERE goodsId = #{goodsId}")
    int deleteGoods(int goodsId);

    //=====================================================================================================================
    @Select("SELECT * FROM activities")
    @Results(id = "activityMap",value = {
            @Result(id = true,property = "activityId",column = "activityId"),
            @Result(property = "username",column = "hostUserId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getUsernameById")),
    })
    List<AdminActivity> getAllActivity();

    @Select("SELECT * FROM activities WHERE activityName LIKE CONCAT('%', #{activityName}, '%') AND details LIKE CONCAT('%', #{details}, '%')")
    @ResultMap("activityMap")
    List<AdminActivity> getActivityND(String activityName, String details);

    @Select("SELECT * FROM activities WHERE activityName LIKE CONCAT('%', #{activityName}, '%')")
    @ResultMap("activityMap")
    List<AdminActivity> getActivityN(String activityName);

    @Select("SELECT * FROM activities WHERE details LIKE CONCAT('%', #{details}, '%')")
    @ResultMap("activityMap")
    List<AdminActivity> getActivityD(String details);

    @Delete("DELETE FROM activities WHERE activityId = #{activityId}")
    Integer deleteActivity(int activityId);


    @Select({
            "SELECT",
            "  (SELECT COUNT(*) FROM post) AS totalPosts,",
            "  (SELECT COUNT(*) FROM goods) AS totalGoods,",
            "  (SELECT COUNT(*) FROM activities) AS totalActivities,",
            "  (SELECT COUNT(*) FROM user) AS totalUsers,",
            "  (SELECT COUNT(*) FROM user WHERE gender = 1) AS maleUsers,",
            "  (SELECT COUNT(*) FROM user WHERE gender = 0) AS femaleUsers,",
            "  (SELECT COUNT(*) FROM user WHERE gender IS NULL OR gender = 2) AS unknownGender,",
            "  (SELECT COUNT(*) FROM goods WHERE sellStatus = '0') AS onSaleGoods,",
            "  (SELECT COUNT(*) FROM goods WHERE sellStatus = '1') AS soldOutGoods,",
            "  (SELECT COUNT(*) FROM activities WHERE status = '0') AS canceledActivities,",
            "(SELECT COUNT(*) FROM activities WHERE activityTime > NOW()) AS enrollActivities,",
            "(SELECT COUNT(*) FROM activities WHERE activityTime <= NOW()) AS endedActivities"
    })
    @Results({
            @Result(property = "totalPosts", column = "totalPosts"),
            @Result(property = "totalGoods", column = "totalGoods"),
            @Result(property = "totalActivities", column = "totalActivities"),
            @Result(property = "totalUsers", column = "totalUsers"),
            @Result(property = "maleUsers", column = "maleUsers"),
            @Result(property = "femaleUsers", column = "femaleUsers"),
            @Result(property = "unknownGender", column = "unknownGender"),
            @Result(property = "onSaleGoods", column = "onSaleGoods"),
            @Result(property = "soldOutGoods", column = "soldOutGoods"),
            @Result(property = "canceledActivities", column = "canceledActivities"),
            @Result(property = "enrollActivities", column = "enrollActivities")
    })
    EchartsData getEchartsData();
}
