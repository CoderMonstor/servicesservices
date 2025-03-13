package com.lmy.services.service;

import com.lmy.services.entity.MsgUserList;

import java.util.List;

public interface UserMessageService {
    List<MsgUserList> getUserMsgList(Integer userId);
    Integer getMsgById(Integer userId);

}
