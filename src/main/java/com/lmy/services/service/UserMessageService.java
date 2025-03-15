package com.lmy.services.service;

import com.lmy.services.entity.GetMessage;
import com.lmy.services.entity.Message;
import com.lmy.services.entity.UserMsgList;

import java.util.List;

public interface UserMessageService {
    List<UserMsgList> getUserMsgList(Integer userId);

    List<UserMsgList> getUserMsgListById(Integer userId);
    Integer getMsgById(Integer userId);

    List<GetMessage> getMsg(Integer sender, Integer receiver);
}
