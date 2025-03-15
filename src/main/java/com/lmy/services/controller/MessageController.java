package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.GetMessage;
import com.lmy.services.entity.UserMsgList;
import com.lmy.services.service.UserMessageService;
import com.lmy.services.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/msg")
public class MessageController {
    private UserMessageService userMessageService;

    @Autowired
    public MessageController(UserMessageService userMessageService) {
        this.userMessageService = userMessageService;
    }
    @RequestMapping("/getUserMsgList")
    public Result<List<UserMsgList>> getUserMsgList(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<UserMsgList> res = userMessageService.getUserMsgListById(userId);
        PageInfo<UserMsgList> pageInfo = new PageInfo<>(res);
        Result<List<UserMsgList>> json;
        json = !res.isEmpty()
                ? new Result<List<UserMsgList>>(res, "1", "获取到聊天记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getMsg")
    public Result<List<GetMessage>> getMsgByChatroom(Integer sender,Integer receiver) {
        List<GetMessage> res = userMessageService.getMsg(sender, receiver);
        Result<List<GetMessage>> json;
        json = !res.isEmpty()
                ? new Result<List<GetMessage>>(res, "1", "获取到聊天记录")
                : new Result<>(null, "0", "未找到数据");
        return json;
    }
//    @RequestMapping("/getMsgByUser")
//    public Result<List<MsgUserList>> getMsgByUser(String userName, Integer page) {
//        PageHelper.startPage(page, 10);
//        Integer res = userMessageService.getMsgByRoomId(Integer roomId);
//        Result<List<MsgUserList>> json;
//        json = !res.isEmpty()
//                ? new Result<List<MsgUserList>>(res, "1", "获取到聊天记录",pageInfo.getPages())
//                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
//        return json;
//    }


//    @RequestMapping("/getMsgUserList")
//    public Result<List<MsgUserList>> getMsgUserList(Integer userId, Integer page) {
//        PageHelper.startPage(page, 10);
//        List<MsgUserList> res = userMessageService.getUserMsgList(userId);
//        PageInfo<MsgUserList> pageInfo = new PageInfo<>(res);
//        Result<List<MsgUserList>> json;
//        json = !res.isEmpty()
//                ? new Result<List<MsgUserList>>(res, "1", "获取到聊天记录", pageInfo.getPages())
//                : new Result<>(null, "0", "未找到数据", pageInfo.getPages());
//        return json;
//   }

//   @RequestMapping("/getMsgByUser")
//    public Result<List<MsgUserList>> getMsgByUser(String userName, Integer page) {
//        PageHelper.startPage(page, 10);
//        List<MsgUserList> res = userMessageService.getMsgByUserName(userName);
//        PageInfo<MsgUserList> pageInfo = new PageInfo<>(res);
//        Result<List<MsgUserList>> json;
//        json = !res.isEmpty()
//                ? new Result<List<MsgUserList>>(res, "1", "获取到聊天记录",pageInfo.getPages())
//                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
//        return json;
//    }

}
