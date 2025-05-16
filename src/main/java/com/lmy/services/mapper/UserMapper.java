package com.lmy.services.mapper;


import com.lmy.services.entity.Updates;
import com.lmy.services.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    //根据id查找用户信息
    @Select("select * ,#{askId} as askId from user WHERE userId  = #{userId} ")
    @Results(id = "userMap",value = {
            @Result(id = true,property = "userId",column = "userId"),
            @Result(property = "postNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getPostNumById")),
            @Result(property = "fanNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getFanNumById")),
            @Result(property = "followNum",column = "userId",
                    one = @One(select = "com.lmy.services.mapper.UserMapper.getFollowNumById")),
//            @Result(property = "isFollow",column = "{askId = askId,userId = user.userId}",
//                    one = @One(select = "com.lmy.services.mapper.UserMapper.isAFollow")),
            @Result(property = "isFollow", column = "{askId = askId, userId = userId}", // 修正列名
                    one = @One(select = "com.lmy.services.mapper.UserMapper.isAFollow")),
    })
    User findUserById(@Param("askId") Integer askId, @Param("userId") Integer userId);
    @Select("select * ,#{askId} as askId from user WHERE username  = #{username} ")
    @ResultMap("userMap")
    User findUserByName(@Param("askId") Integer askId, String username);

    //添加用户
//    @Insert({"insert into user(id,email,password) values(#{id},#{email},#{password})"})
//    @Options(useGeneratedKeys=true,keyColumn="userId",keyProperty = "userId")
//    Integer insertUser(User user);
    @Insert({"insert into user(email,password) values(#{email},#{password})"})
    @Options(useGeneratedKeys=true, keyColumn="userId", keyProperty = "userId")
    Integer insertUser(User user);

    //登录操作，查询出结果就登录成功，查询结果空就失败
    @Select("SELECT " +
            "user.*, " +
            "(SELECT COUNT(*) FROM post WHERE userId = user.userId) AS postNum, " +
            "(SELECT COUNT(*) FROM fans WHERE fanId = user.userId) AS followNum, " +
            "(SELECT COUNT(*) FROM fans WHERE followedId = user.userId) AS fanNum " +
            "FROM user " +
            "WHERE email = #{email} AND password = #{password}")
    User logIn(User user);
    //更新密码操作，更新成功返回1，否则返回0
    @Update("update user set password=#{password} where email=#{email}")
    int updatePwd(String email,String password);

    //更新用户信息操作，更新成功返回1，否则返回0
    @Update("update user set username=#{username},bio=#{bio},avatarUrl=#{avatarUrl} where email=#{email}")
    int updateUserDetail(User user);

    //查找用户关注的人
    @Select("select * ,#{userId}  as askId from user WHERE userId IN (SELECT followedId FROM fans WHERE fanId= #{userId})")
    @ResultMap("userMap")
    List<User> findFollow(Integer userId);

    //查找关注用户的人即粉丝
    @Select("select *,#{userId} as askId from user WHERE user.userId IN (SELECT fanId from fans WHERE followedId= #{userId})")
    @ResultMap("userMap")
    List<User> findFans(Integer userId);

    @Select("select *,#{askId} as askId from user WHERE user.userId IN (SELECT userId from likePost WHERE postId= #{postId})")
    @ResultMap("userMap")
    List<User> getLikedUser(Integer askId,Integer postId);
    @Select("SELECT *,#{askId} as askId from user where username like '%${key}%'")
    @ResultMap("userMap")
    List<User> searchUser(Integer askId,String key);
    //关注一个用户，提供关注者与被关注者
    @Insert("insert into fans (fanId,followedId) values(#{fanId},#{followedId})")
    int followAUser(Integer fanId, Integer followedId);
    //取关一个用户，提供关注者与被关注者
    @Delete("DELETE FROM fans WHERE fanId = #{fanId} and followedId = #{followedId}")
    int cancelFollowAUser(Integer fanId,Integer followedId);

    //通用修改个人信息
    @Update("update user set ${property} = #{value} where userId=#{userId}")
    Integer updateUserProperty(Integer userId, String property, String value);

    //查询用户名是否已存在
    @Select("select count(*) from user where username = #{username}")
    Integer isExistTheUsername(String username);

    //根据userId查询动态数量
    @Select("select count(*) from post where userId = #{userId}")
    Integer getPostNumById(Integer userId);
    //根据userId查询粉丝数量
    @Select("select count(*) from fans where followedId = #{userId}")
    Integer getFanNumById(Integer userId);
    //根据userId查询关注数量
    @Select("select count(*) from fans where fanId = #{userId}")
    Integer getFollowNumById(Integer userId);

    //查询者与被查询的关系
    @Select("SELECT count(*) from fans where fanId = #{askId} and followedId = #{userId}")
    Integer isAFollow(Integer askId, Integer userId);

    @Select("SELECT count(*) from fans where followedId = #{askId} and fanId = #{userId}")
    Integer isAFan(Integer askId, Integer userId);
    @Select("SELECT count(*) from user where email = #{email}")
    Integer isExistTheEmail(String email);

    @Select("select username from user where userId=#{userId}")
    String getUsernameById(Integer userId);
    @Select("select avatarUrl from user where userId=#{userId}")
    String getAvatarById(Integer userId);

    @Select("SELECT * FROM updates order by date DESC LIMIT 1 ")
    Updates checkUpdate();

}
