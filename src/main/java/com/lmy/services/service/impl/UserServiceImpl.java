package com.lmy.services.service.impl;


import com.lmy.services.entity.Updates;
import com.lmy.services.entity.User;
import com.lmy.services.mapper.UserMapper;
import com.lmy.services.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
//    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
//        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User findUserById(Integer askId, Integer userId) {
        return userMapper.findUserById(askId,userId);
    }

    @Override
    public User findUserByName(Integer askId, String username) {
        return userMapper.findUserByName(askId, username);
    }

    @Override
    public Integer insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public User logIn(User user) {
        return userMapper.logIn(user);
    }

    @Override
    public int updatePwd(String email,String password) {
        return userMapper.updatePwd(email,password);
    }

    @Override
    public int updateUserDetail(User user) {
        return userMapper.updateUserDetail(user);
    }

    @Override
    public List<User> findFollow(Integer userId) {
        return userMapper.findFollow(userId);
    }

    @Override
    public List<User> findFan(Integer userId) {
        return userMapper.findFans(userId);
    }

    @Override
    public int followAUser(Integer fanId, Integer followedId) {
        return userMapper.followAUser(fanId,followedId);
    }

    @Override
    public int cancelFollowAUser(Integer fanId, Integer followedId) {
        return userMapper.cancelFollowAUser(fanId,followedId);
    }

    @Override
    public Integer updateUserProperty(Integer userId, String property, String value) {
        return userMapper.updateUserProperty(userId,property,value);
    }

    @Override
    public Integer isExistTheUsername(String username) {
        return userMapper.isExistTheUsername(username);
    }

    @Override
    public Integer isExistTheEmail(String email) {
        return userMapper.isExistTheEmail(email);
    }

    @Override
    public List<User> getLikedUser(Integer askId, Integer postId) {
        return userMapper.getLikedUser(askId, postId);
    }

    @Override
    public List<User> searchUser(Integer askId,String key) {
        return userMapper.searchUser(askId,key);
    }

    @Override
    public Updates checkUpdate() {
        return userMapper.checkUpdate();
    }


}
