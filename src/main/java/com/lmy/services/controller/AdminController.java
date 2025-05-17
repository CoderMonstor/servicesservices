package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Admin;
import com.lmy.services.entity.Vo.*;
import com.lmy.services.service.AdminService;
import com.lmy.services.utils.MD5Util;
import com.lmy.services.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public boolean login(@RequestBody Admin admin) {
        System.out.println(admin.getUsername());
        Admin ad= adminService.login(admin.getUsername());
        System.out.println("正在验证管理员登陆 ");
        return ad != null && ad.getPassword().equals(admin.getPassword());
    }
    @RequestMapping("/echartsData")
    public Result<EchartsData> getEchartsData() {
        try {
            EchartsData data = adminService.getEchartsData();
            return new Result<>(data,"1", "获取成功");
        } catch (Exception e) {
            return new Result<>("0", "获取失败");
        }
    }

    @RequestMapping("/deleteUser")
    public boolean deleteUser(Integer userId) {
        System.out.println("正在删除用户 ");
        return adminService.deleteUser(userId);
    }

    @RequestMapping("/findUser")
    public List<AdminUser> findUser(@RequestBody Map<String, String> map) {
        System.out.println("正在查找用户 ");
        return adminService.findUser(map);
    }
    @RequestMapping("/updateUser")
    public Result<Integer> updateUser(@RequestBody UserUpdate userUpdate) {
        System.out.println("正在修改用户 ");
        try {

            Integer res= adminService.updateUser(userUpdate);
            return new Result<>("1","修改成功");
        }catch (Exception e){
            return new Result<>("0","修改失败");
        }
    }
    @RequestMapping("/getUserById")
    public UserDetail getUserById(Integer userId) {
        System.out.println("正在获取用户 byId ：id=  "+ userId);
        return adminService.getUserById(userId);
    }
    @RequestMapping("/resetPassword")
    public boolean resetPassword(Integer userId) {
//        System.out.println("正在重置密码 ");
//        return adminService.resetPassword(userId);
        System.out.println("正在重置密码 ");
        String newPassword = "123456"; // 假设默认密码为 123456
        String encryptedPassword = MD5Util.encrypt(newPassword); // 使用 MD5 加密
        return adminService.resetPassword(userId, encryptedPassword);

    }

    @RequestMapping("/posts")
    public List<AdminPost> getPosts(@RequestBody Map<String, Object> queryParams) {
        String username = (String) queryParams.get("username");
        String title = (String) queryParams.get("title");
        List<?> dateRange = (List<?>) queryParams.get("dateRange");

        LocalDate startDate = null;
        LocalDate endDate = null;

        if (dateRange != null && dateRange.size() == 2) {
            try {
                String start = dateRange.get(0).toString();
                String end = dateRange.get(1).toString();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                startDate = LocalDate.parse(start, formatter);
                endDate = LocalDate.parse(end, formatter);
            } catch (Exception e) {
                System.out.println("日期格式错误");
            }
        }
        boolean hasUsername = username != null;
        boolean hasTitle = title != null;
        boolean hasDateRange = (startDate != null && endDate != null);

        if (hasUsername && hasTitle && hasDateRange) {
            return adminService.getPostUTD(username, title, startDate, endDate);
        } else if (hasUsername && hasTitle) {
            return adminService.getPostUT(username, title);
        } else if (hasUsername && hasDateRange) {
            return adminService.getPostUD(username, startDate, endDate);
        } else if (hasTitle && hasDateRange) {
            return adminService.getPostTD(title, startDate, endDate);
        } else if (hasUsername) {
            return adminService.getPostU(username);
        } else if (hasTitle) {
            return adminService.getPostT(title);
        } else if (hasDateRange) {
            return adminService.getPostD(startDate, endDate);
        } else {
            return adminService.getAllPosts();
        }
    }

    @DeleteMapping("/post/{postId}")
    public ResponseEntity<Void> deletePost(@PathVariable int postId) {
        int rows = adminService.deletePost(postId);
        if (rows > 0) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //==================================================================================================================
    @PostMapping("/getGoods")
    public Result<List<AdminGoods>> getGoods(
            @RequestBody Map<String, Object> queryParams) {
        // 1. 解析分页参数（默认第1页，每页10条）
        int pageNum = 1;
        int pageSize = 10;
        if (queryParams.get("pageNum") != null) {
            pageNum = Integer.parseInt(queryParams.get("pageNum").toString());
        }
        if (queryParams.get("pageSize") != null) {
            pageSize = Integer.parseInt(queryParams.get("pageSize").toString());
        }

        // 2. 解析查询条件
        String goodsName = (String) queryParams.get("goodsName");
        String goodsDesc = (String) queryParams.get("goodsDesc");

        // 3. 执行分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<AdminGoods> goodsList;

        if (goodsName != null && goodsDesc != null) {
            goodsList = adminService.getGoodsND(goodsName, goodsDesc);
        } else if (goodsName != null) {
            goodsList = adminService.getGoodsN(goodsName);
        } else if (goodsDesc != null) {
            goodsList = adminService.getGoodsByD(goodsDesc);
        } else {
            goodsList = adminService.getAllGoods();
        }
        // 4. 封装分页结果
        PageInfo<AdminGoods> pageInfo = new PageInfo<>(goodsList);
//        return new Result<>(goodsList,"1", "查询成功", pageInfo.getTotal(), pageInfo.getPages());
        return  !goodsList.isEmpty()
                ? new Result<>(goodsList, "1", "查询成功",pageInfo.getTotal(), pageInfo.getPages())
                : new Result<>( "0", "没得商品");
    }

    @DeleteMapping("/goods/{goodsId}")
    public Result<Integer> deleteGoods(@PathVariable int goodsId) {
        System.out.println("正在删除商品 ");
        try {
            Integer res= adminService.deleteGoods(goodsId);
            return new Result<>("1","删除成功");
        }catch (Exception e){
            return new Result<>("0","删除失败");
        }
    }
    //==================================================================================================================
    @PostMapping("/getActivity")
    public Result<List<AdminActivity>> getActivity(
            @RequestBody Map<String, Object> queryParams) {
        int pageNum = 1;
        int pageSize = 10;
        if (queryParams.get("pageNum") != null) {
            pageNum = Integer.parseInt(queryParams.get("pageNum").toString());
        }
        if (queryParams.get("pageSize") != null) {
            pageSize = Integer.parseInt(queryParams.get("pageSize").toString());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<AdminActivity> activityList;
        String activityName = (String) queryParams.get("activityName");
        String details = (String) queryParams.get("details");
        if (activityName != null && details != null) {
            activityList = adminService.getActivityND(activityName, details);
        } else if (activityName != null) {
            activityList = adminService.getActivityN(activityName);
        } else if (details != null) {
            activityList = adminService.getActivityD(details);
        } else {
            activityList = adminService.getAllActivity();
        }
        PageInfo<AdminActivity> pageInfo = new PageInfo<>(activityList);
//        return new Result<>(activityList,"1", "查询成功", pageInfo.getTotal(), pageInfo.getPages());
        return activityList.isEmpty()
                ? new Result<>("0", "查询失败")
                :new Result<>(activityList,"1", "查询成功", pageInfo.getTotal(), pageInfo.getPages());
    }

    @DeleteMapping("/activity/{activityId}")
    public Result<Integer> deleteActivity(@PathVariable int activityId) {
        System.out.println("正在删除活动 ");
        try {
            Integer res= adminService.deleteActivity(activityId);
            return new Result<>("1","删除成功");
        }catch (Exception e){
            return new Result<>("0","删除失败");
        }
    }

}


