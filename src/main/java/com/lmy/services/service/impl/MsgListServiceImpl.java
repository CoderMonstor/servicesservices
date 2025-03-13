package com.lmy.services.service.impl;

import com.lmy.services.mapper.UserMessageMapper;
import com.lmy.services.service.MsgListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service("msgListServices")
//public class MsgListServiceImpl implements MsgListService {
//
//    private final UserMessageMapper userMessageMapper; // 使用private修饰符更符合规范
//
//    @Autowired
//    public MsgListServiceImpl(UserMessageMapper userMessageMapper) {
//        this.userMessageMapper = userMessageMapper;
//    }
//
//    @Override
//    public List<UserMessageMapper> getMsgUserList(Integer userId) {
//        return userMessageMapper.getMsgUserList(userId);
//    }
//}
