package com.lmy.services.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Admin;
import com.lmy.services.entity.Vo.*;
import com.lmy.services.mapper.AdminMapper;
import com.lmy.services.service.AdminService;
import com.lmy.services.utils.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
        @Autowired
        private AdminMapper adminMapper;
        public Admin login(String adminUsername) {
            System.out.println("正在验证管理员登陆 " + adminUsername);
            return adminMapper.login(adminUsername);
        }
        public boolean deleteUser(Integer userId) {
            return adminMapper.deleteUser(userId);
        }
        public List<AdminUser> findUser(Map<String, String> map) {
            Integer userId = null;
            String username = null;
            Integer fuzzy = null;

            try {
                if (map.containsKey("userId") && map.get("userId") != null && !map.get("userId").isEmpty()) {
                    userId = Integer.parseInt(map.get("userId"));
                }
            } catch (NumberFormatException e) {
                System.out.println("userId 转换失败");
            }

            if (map.containsKey("username")) {
                username = map.get("username");
            }

            if (map.containsKey("fuzzy")) {
                fuzzy = "true".equals(map.get("fuzzy")) ? 1 : 0;
            }
            // 按组合情况分类
            if (userId != null && username != null && !username.isEmpty()) {
                if (fuzzy != null && fuzzy == 1) {
                    return adminMapper.findUserByIdAndUsernameFuzzy(userId, username);
                } else {
                    return adminMapper.findUserByIdAndUsername(userId, username);
                }
            }

            if (userId != null) {
                return adminMapper.findUserWithID(userId);
            }

            if (username != null && !username.isEmpty()) {
                if (fuzzy != null && fuzzy == 1) {
                    return adminMapper.findUserByUsernameFuzzy(username);
                } else {
                    return adminMapper.findUserByUsername(username);
                }
            }

            return adminMapper.findAllUsers();
        }
        public UserDetail getUserById(Integer userId) {
            return adminMapper.getUserById(userId);
        }

//        public boolean resetPassword(Integer userId) {
//            return adminMapper.resetPassword(userId);
//        }
        @Override
        public boolean resetPassword(Integer userId, String encryptedPassword) {
            return adminMapper.resetPassword(userId, encryptedPassword);
        }
        public Integer updateUser(UserUpdate userUpdate) {return adminMapper.updateUser(userUpdate);}
//=======================================================================================================================
    @Override
    public List<AdminPost> getAllPosts() {
        return adminMapper.findAllPosts();
    }

    @Override
    public List<AdminPost> getPostUTD(String username, String title, LocalDate startDate, LocalDate endDate) {
        return adminMapper.getPostUTD(username, title, startDate, endDate);
    }

    @Override
    public List<AdminPost> getPostUT(String username, String title) {
        return adminMapper.getPostUT(username, title);
    }

    @Override
    public List<AdminPost> getPostUD(String username, LocalDate startDate, LocalDate endDate) {
        return adminMapper.getPostUD(username, startDate, endDate);
    }

    @Override
    public List<AdminPost> getPostTD(String title, LocalDate startDate, LocalDate endDate) {
        return adminMapper.getPostTD(title, startDate, endDate);
    }

    @Override
    public List<AdminPost> getPostU(String username) {
        return adminMapper.getPostU(username);
    }

    @Override
    public List<AdminPost> getPostT(String title) {
        return adminMapper.getPostT(title);
    }

    @Override
    public List<AdminPost> getPostD(LocalDate startDate, LocalDate endDate) {
        return adminMapper.getPostD(startDate, endDate);
    }

    @Override
    public Integer deletePost(int postId) {
        return adminMapper.deletePost(postId);
    }

//=======================================================================================================================
    @Override
    public List<AdminGoods> getGoodsND(String goodsName, String goodsDesc) {
        return adminMapper.getGoodsND(goodsName, goodsDesc);
    }

    @Override
    public List<AdminGoods> getGoodsN(String goodsName) {
        return adminMapper.getGoodsN(goodsName);
    }

    @Override
    public List<AdminGoods> getGoodsByD(String goodsDesc) {
        return adminMapper.getGoodsByD(goodsDesc);
    }

    @Override
    public List<AdminGoods> getAllGoods() {
        return adminMapper.getAllGoods();
    }

    @Override
    public int deleteGoods(int goodsId) {
        return adminMapper.deleteGoods(goodsId);
    }

    @Override
    public List<AdminActivity> getActivityND(String activityName, String details) {
        return adminMapper.getActivityND(activityName, details);
    }

    @Override
    public List<AdminActivity> getActivityN(String activityName) {
        return adminMapper.getActivityN(activityName);
    }

    @Override
    public List<AdminActivity> getActivityD(String details) {
        return adminMapper.getActivityD(details);
    }

    @Override
    public List<AdminActivity> getAllActivity() {
        return adminMapper.getAllActivity();
    }

    @Override
    public Integer deleteActivity(int activityId) {
        return adminMapper.deleteActivity(activityId);
    }

    @Override
    public EchartsData getEchartsData() {
        return adminMapper.getEchartsData();
    }

}
