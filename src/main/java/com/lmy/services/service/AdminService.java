package com.lmy.services.service;

import com.lmy.services.entity.Admin;
import com.lmy.services.entity.Vo.*;


import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface AdminService {

    Admin login(String username);

    boolean deleteUser(Integer userId);

    UserDetail getUserById(Integer userId);

//    boolean resetPassword(Integer userId);
    boolean resetPassword(Integer userId, String encryptedPassword);

    Integer updateUser(UserUpdate userUpdate);

    List<AdminUser> findUser(Map<String, String> map);

    List<AdminPost> getAllPosts();

    List<AdminPost> getPostUTD(String username, String title, LocalDate startDate, LocalDate endDate);

    List<AdminPost> getPostUT(String username, String title);

    List<AdminPost> getPostUD(String username, LocalDate startDate, LocalDate endDate);

    List<AdminPost> getPostTD(String title, LocalDate startDate, LocalDate endDate);

    List<AdminPost> getPostU(String username);

    List<AdminPost> getPostT(String title);

    List<AdminPost> getPostD(LocalDate startDate, LocalDate endDate);

    Integer deletePost(int postId);

    List<AdminGoods> getGoodsND(String goodsName, String goodsDesc);

    List<AdminGoods> getGoodsN(String goodsName);

    List<AdminGoods> getGoodsByD(String goodsDesc);

    List<AdminGoods> getAllGoods();

    int deleteGoods(int goodsId);

    List<AdminActivity> getActivityND(String activityName, String details);

    List<AdminActivity> getActivityN(String activityName);

    List<AdminActivity> getActivityD(String details);

    List<AdminActivity> getAllActivity();

    Integer deleteActivity(int activityId);

    EchartsData getEchartsData();
}
