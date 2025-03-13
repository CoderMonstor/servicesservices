package com.lmy.services.service.impl;

import com.lmy.services.entity.MsgUserList;
import com.lmy.services.mapper.UserMessageMapper;
import com.lmy.services.service.UserMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserMessageServiceImpl implements UserMessageService {
    final UserMessageMapper userMessageMapper;

    @Autowired
    public UserMessageServiceImpl(UserMessageMapper userMessageMapper) {
        this.userMessageMapper = userMessageMapper;
    }
    @Override
    public List<MsgUserList> getUserMsgList(Integer userId) {
        return userMessageMapper.getMsgUserList(userId);
    }

    @Override
    public Integer getMsgById(Integer userId) {
        return userMessageMapper.findChatroomIdByUsers(userId, userId);
    }
}
