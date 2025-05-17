package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.lmy.services.entity.Updates;
import com.lmy.services.entity.User;
import com.lmy.services.service.MailService;
import com.lmy.services.service.UserService;
import com.lmy.services.utils.Constant;
import com.lmy.services.utils.MD5Util;
import com.lmy.services.utils.Result;
import com.lmy.services.utils.RandomCodeUtil;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final MailService mailService;
    private final RandomCodeUtil randomCodeUtil;
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    public UserController(UserService userService, MailService mailService, RandomCodeUtil randomCodeUtil) {
        this.userService = userService;
        this.mailService = mailService;
        this.randomCodeUtil = randomCodeUtil;
    }



    //根据ID查找用户
    @RequestMapping("/findUserById")
    public Result<User> findUserById(Integer askId, Integer userId) {
        User res =userService.findUserById(askId,userId);
        Result<User> json;
        json = res != null
                ? new Result<>(res, "1", "查询成功")
                : new Result<>(null, "0", "查询不到该userId");
        return json;
    }


    @RequestMapping("/findUserByName")
    public Result<User> findUserByName(Integer askId, String username) {
        User res =userService.findUserByName(askId,username);
        Result<User> json;
        json = res != null
                ? new Result<>(res, "1", "查询成功")
                : new Result<>(null, "0", "查询不到该userId");
        return json;
    }
    //登录
//    @RequestMapping("/logIn")
//    public Result<User> logIn(User user, HttpSession session) {
//        User res = userService.logIn(user);
//        if(res!=null){
//            session.setAttribute(Constant.USER_TOKEN, res.getUserId());
//        }
//        Result<User> json;
//        json = res != null
//                ? new Result<>(res, "1", "验证成功")
//                : new Result<>(null, "0", "验证失败");
//        return json;
//    }
    @RequestMapping("/logIn")
    public Result<User> logIn(User user, HttpSession session) {
        // 1. 对密码进行MD5加密
        if (user.getPassword() != null) {
            String encryptedPwd = MD5Util.encrypt(user.getPassword());
            System.out.println("加密后的密码：" + encryptedPwd);
            user.setPassword(encryptedPwd);
        }

        // 2. 执行登录验证
        User res = userService.logIn(user);

        // 3. 登录成功处理
        if (res != null) {
            session.setAttribute(Constant.USER_TOKEN, res.getUserId());
            session.setMaxInactiveInterval(1800); // 可选：设置session过期时间（30分钟）
        }

        // 4. 构建返回结果
        return new Result<>(
                res,
                res != null ? "1" : "0",
                res != null ? "验证成功" : "验证失败"
        );
    }
    //添加成功返回1，捕获到异常既用户已存在返回0,验证码不符返回-1
//    @RequestMapping("/addUser")
//    public Result<User> addUser(String email, String password, String code, HttpSession session) {
//        Result<User> json;
//        //获得session里存的验证码用来比对
//        String sessionCode;
//        //若session中没有code返回-2
//        try {
//            sessionCode = session.getAttribute("code").toString();
//        } catch (Exception e) {
//            logger.error("session中没有code" + e.toString());
//            json =  new Result<>(null, "-2", "验证码不符或已经超时了");
//            return json;
//        }
//
//        User user = new User(email, password);
//        if (code.equals(sessionCode)) {
//            if(userService.isExistTheEmail(email) == 0){
//                session.setAttribute("code", "null");
//                userService.insertUser(user);
//                logger.info(user.toString());
//                json =  new Result<>(user, "1", "注册成功请前往登录");
//            } else{
//                json =  new Result<>(null, "0", "邮箱已经注册过了");
//            }
//        } else {
//            json =  new Result<>(null, "-1", "验证码不符");
//        }
//        return json;
//    }

    @RequestMapping("/addUser")
    public Result<User> addUser(
            String email,
            String password,
            String code,
            HttpSession session) {

        // 初始化返回对象
        Result<User> json;

        // 1. 验证码校验逻辑
        String sessionCode;
        try {
            sessionCode = (String) session.getAttribute("code");
            if (sessionCode == null) {
                throw new Exception("Session中验证码不存在");
            }
        } catch (Exception e) {
            logger.error("验证码校验失败: {}", e.getMessage());
            return new Result<>(null, "-2", "验证码不符或已经超时了");
        }

        // 2. MD5加密密码
        String encryptedPwd = MD5Util.encrypt(password);
//        System.out.println("加密后的密码：" + encryptedPwd);
        // 3. 创建User对象（仅包含必要字段）
        User user = new User(email, encryptedPwd);
//        user.setEmail(email);
//        user.setPassword(encryptedPwd);

        // 4. 验证码比对
        if (!code.equals(sessionCode)) {
            return new Result<>(null, "-1", "验证码不符");
        }

        // 5. 邮箱存在性检查
        if (userService.isExistTheEmail(email) > 0) {
            return new Result<>(null, "0", "邮箱已经注册过了");
        }

        // 6. 执行注册逻辑
        try {
            // 清空Session中的验证码（防止重复使用）
            session.setAttribute("code", null);

            // 插入用户（使用Service层方法）
            userService.insertUser(user);

            logger.info("用户注册成功: {}", user.toString());
            return new Result<>(user, "1", "注册成功请前往登录");

        } catch (Exception e) {
            logger.error("注册失败: {}", e.getMessage());
            return new Result<>(null, "-3", "系统错误，请稍后再试");
        }
    }
    //更新密码
//    @RequestMapping("/updatePwd")
//    public int updatePwd(String email, String password, String code, HttpSession session) {
//        //获得session里存的验证码用来比对
//        String sessionCode;
//        //若session中没有code返回-2
//        try {
//            sessionCode = session.getAttribute("code").toString();
//        } catch (Exception e) {
//            logger.error("session中没有code" + e.toString());
//            return -2;
//        }
//        if (code.equals(sessionCode)) {
//            try {
//                session.setAttribute("code", "null");
//                return userService.updatePwd(email, password);
//            } catch (Exception e) {
//                logger.warn(e.toString());
//                return 0;
//            }
//        } else {
//            return -1;
//        }
//    }
    @RequestMapping("/updatePwd")
    public int updatePwd(String email, String password, String code, HttpSession session) {

        // 1. 验证码校验
        String sessionCode;
        try {
            sessionCode = (String) session.getAttribute("code");
            if (sessionCode == null) {
                throw new Exception("验证码不存在");
            }
        } catch (Exception e) {
            logger.error("验证码校验失败: {}", e.getMessage());
            return -2;
        }

        // 2. 密码加密（核心修改点）
        String encryptedPwd = MD5Util.encrypt(password);
        logger.info("加密后的密码：{}", encryptedPwd);
        // 3. 验证码比对
        if (!code.equals(sessionCode)) {
            logger.warn("验证码不匹配: 输入={}, 实际={}", code, sessionCode);
            return -1;
        }

        // 4. 执行密码更新
        try {
            // 清空Session中的验证码
            session.setAttribute("code", null);

            // 调用Service层更新密码（已加密）
            int affectedRows = userService.updatePwd(email, encryptedPwd);

            if (affectedRows > 0) {
                logger.info("密码更新成功: {}", email);
                return 1;
            } else {
                logger.warn("密码更新失败: 用户不存在");
                return 0;
            }

        } catch (Exception e) {
            logger.error("系统异常: {}", e.getMessage());
            return 0;
        }
    }
    //更新用户信息
    @RequestMapping("/updateUserDetail")
    public int updateUserDetail(User user) {
        return userService.updateUserDetail(user);
    }
    //处理发送验证码的请求，生成一个随机验证码，添加到邮件中发送出去还要把code保存下来
    @RequestMapping("/sendEmail")
    public int sendEmail(String email, HttpSession session) {
        String code = randomCodeUtil.getRandomCode();
        session.setAttribute("code", code);
        logger.info(code);
        try {
            mailService.sendHtmlMail(email, code);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    //查找用户关注的人
    @RequestMapping("/findFollow")
    public Result<List<User>> findFollow(Integer userId, Integer page) {
        PageHelper.startPage(page, 20);
        List<User> res = userService.findFollow(userId);
        PageInfo<User> pageInfo = new PageInfo<>(res);
        Result<List<User>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "查询成功",pageInfo.getPages())
                : new Result<>(res, "0", "没有正在关注的人",pageInfo.getPages());
        return json;
    }
    @RequestMapping("/searchUser")
    public Result<List<User>> searchUser(Integer askId, String key, Integer page) {
        PageHelper.startPage(page, 20);
        List<User> res = userService.searchUser(askId, key);
        PageInfo<User> pageInfo = new PageInfo<>(res);
        Result<List<User>> json;
        json = new Result<>(res, "1", "查询成功",pageInfo.getPages());
        return json;
    }

    //查找用户的粉丝
    @RequestMapping("/findFan")
    public Result<List<User>> findFan(Integer userId, Integer page) {
        PageHelper.startPage(page, 20);
        List<User> res = userService.findFan(userId);
        PageInfo<User> pageInfo = new PageInfo<>(res);
        Result<List<User>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "查询成功", pageInfo.getPages())
                : new Result<>(res, "0", "没得粉丝", pageInfo.getPages());
        return json;
    }
    @RequestMapping("/getLikedUser")
    public Result<List<User>> getLikedUser(Integer askId, Integer postId, Integer page) {
        PageHelper.startPage(page, 20);
        List<User> res = userService.getLikedUser(askId,postId);
        PageInfo<User> pageInfo = new PageInfo<>(res);
        Result<List<User>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "查询成功", pageInfo.getPages())
                : new Result<>(res, "0", "没得点赞", pageInfo.getPages());
        return json;
    }

    @RequestMapping("/followAUser")
    public Result<Integer> followAUser(Integer fanId, Integer followedId){
        Result<Integer> json;
        try{
            Integer res = userService.followAUser(fanId,followedId);
            json = new Result<>("1","关注成功");
        }catch (Exception e){
            json = new Result<>("0","已经关注过了");
            //logger.info("重复关注"+e.toString());
        }
        return json;
    }
    @RequestMapping("/cancelFollowAUser")
    public Result<Integer> cancelFollowAUser(Integer fanId, Integer followedId){
        Result<Integer> json;
        int res = userService.cancelFollowAUser(fanId,followedId);
        json = new Result<>(Integer.toString(res),"取消关注成功");
        return json;
    }
    @RequestMapping("/updateUserProperty")
    public Result<Integer> updateUserProperty(Integer userId, String property, String value){
        //logger.warn(value);
        Result<Integer> json;
        Integer res = userService.updateUserProperty(userId,property,value);
        json = new Result<>(Integer.toString(res),"");
        return json;
    }

    @RequestMapping("/isExistTheUsername")
    public Result<Integer> isExistTheUsername(String username){
        Result<Integer> json;
        Integer res = userService.isExistTheUsername(username);
        json = new Result<>(Integer.toString(res),"");
        return json;
    }
    @RequestMapping("/checkUpdate")
    public Result<Updates> checkUpdate(){
        Result<Updates> json;
        try{
            Updates res = (Updates) userService.checkUpdate();
            json = new Result<>(res,"1","检测成功");
        }catch (Exception e){
            logger.error(e.toString());
            json = new Result<>("0","未知错误");
        }
        return json;
    }

}
