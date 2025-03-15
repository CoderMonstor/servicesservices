package com.lmy.services.service.impl;

import com.lmy.services.entity.GetMessage;
import com.lmy.services.entity.UserMsgList;
import com.lmy.services.mapper.UserMessageMapper;
import com.lmy.services.service.UserMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserMessageServiceImpl implements UserMessageService {
    final UserMessageMapper userMessageMapper;

    @Autowired
    public UserMessageServiceImpl(UserMessageMapper userMessageMapper) {
        this.userMessageMapper = userMessageMapper;
    }
    @Override
    public List<UserMsgList> getUserMsgList(Integer userId) {
        return userMessageMapper.getMsgUserList(userId);
    }

    @Override
    public List<UserMsgList> getUserMsgListById(Integer userId) {
        return userMessageMapper.getUserMsgList(userId);
    }

    @Override
    public Integer getMsgById(Integer userId) {
        return userMessageMapper.findChatroomIdByUsers(userId, userId);
    }

    @Override
    public  List<GetMessage> getMsg(Integer sender, Integer receiver) {
        return userMessageMapper.getMsg(sender, receiver);
    }


}
