package com.lmy.services.service;

import com.lmy.services.entity.GetMessage;
import com.lmy.services.entity.Message;
import com.lmy.services.entity.UserMsgList;

import java.util.List;

public interface UserMessageService {


    List<UserMsgList> getUserMsgListById(Integer userId);

    List<GetMessage> getMsg(Integer sender, Integer receiver);
}
