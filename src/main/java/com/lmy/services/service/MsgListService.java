package com.lmy.services.service;

import com.lmy.services.mapper.UserMessageMapper;

import java.util.List;

public interface MsgListService {
    List<UserMessageMapper> getMsgUserList(Integer userId);
}
