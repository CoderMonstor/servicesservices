package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.mapper.UserMessageMapper;
import com.lmy.services.service.MsgListService;
import com.lmy.services.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/msg")
public class MessageController {
//    private MessageService messageService;
    private MsgListService msgListService;
//    // 构造函数注入
//    @Autowired
//    public MessageController(MessageService messageService, MsgListService msgListService) {
//        this.messageService = messageService;
//        this.msgListService = msgListService;
//    }
//    @RequestMapping("/getMsgListById")
//    public Result<List<Chatroom>> getMsgListById(Integer userId, Integer page) {
//        PageHelper.startPage(page, 10);
//        List<Chatroom> res = messageService.getMsgById(userId);
//        PageInfo<Chatroom> pageInfo = new PageInfo<Chatroom>(res);
//        Result<List<Chatroom>> json;
//        json = !res.isEmpty()
//                ? new Result<List<Chatroom>>(res, "1", "获取到聊天记录", pageInfo.getPages())
//                : new Result<List<Chatroom>>(null, "0", "聊天记录数量为0", pageInfo.getPages());
//        return json;
//    }
    @Autowired
    public MessageController(MsgListService msgListService){
        this.msgListService = msgListService;
    }


    @RequestMapping("/getMsgUserList")
    public Result<List<UserMessageMapper>> getMsgUserList(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<UserMessageMapper> res = msgListService.getMsgUserList(userId);
        PageInfo<UserMessageMapper> pageInfo = new PageInfo<>(res);
        Result<List<UserMessageMapper>> json;
        json = !res.isEmpty()
                ? new Result<>(res, "1", "获取到聊天记录", pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据", pageInfo.getPages());
        return json;
   }

}
