package com.lmy.services.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.lmy.services.entity.Chatroom;
import com.lmy.services.entity.Message;
//import com.lmy.services.mapper.ChatroomMapper;
//import com.lmy.services.mapper.MessageMapper;
import com.lmy.services.mapper.UserMessageMapper;
import com.lmy.services.service.ChatService;
import com.lmy.services.utils.ChatType;
import com.lmy.services.utils.Constant;
import com.lmy.services.utils.ResponseJson;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.Map.Entry;

@Service
public class ChatServiceImpl implements ChatService {

//    @Autowired
//    private ChatroomMapper chatroomMapper;

    @Autowired
    private UserMessageMapper userMessageMapper;

//    @Autowired
//    private MessageMapper messageMapper;
    private static final Logger LOGGER = LoggerFactory.getLogger(ChatServiceImpl.class);


    @Override
    public void register(JSONObject param, ChannelHandlerContext ctx) {
        String userId = (String)param.get("userId");
        Constant.onlineUserMap.put(userId, ctx);
        String responseJson = new ResponseJson().success()
                .setData("type", ChatType.REGISTER)
                .toString();
        sendMessage(ctx, responseJson);
        LOGGER.info(MessageFormat.format("userId为 {0} 的用户登记到在线用户表，当前在线人数为：{1}"
                , userId, Constant.onlineUserMap.size()));
    }

    @Override
    public void singleSend(JSONObject param, ChannelHandlerContext ctx) {
        try {
            String fromUserId = (String) param.get("fromUserId");
            Integer sender = Integer.parseInt(fromUserId);
            Integer receiver = Integer.parseInt((String) param.get("toUserId"));
            // 保存实际的发送者ID
            Integer actualSender = sender;
            // 确保 sender 小于 receiver，违反数据库约束时会报错
            if (sender > receiver) {
                // 交换 sender 和 receiver
                Integer temp = sender;
                sender = receiver;
                receiver = temp;
            }

            String messageContent = (String) param.get("content");

            // 查询是否已有聊天室
            Integer roomId = userMessageMapper.getChatRoomId(sender, receiver);

            if (roomId == null) {
                // 如果没有聊天室，创建一个新聊天室
                Chatroom chatroom = new Chatroom();
                chatroom.setSender(sender);
                chatroom.setReceiver(receiver);
                userMessageMapper.insertChatRoom(chatroom);
                roomId = chatroom.getRoomId();
            }

            // 存储消息到数据库
            Message message = new Message();
            message.setRoomId(roomId);
            message.setSender(actualSender);  // 确保消息的发送者是实际的发送者
            message.setMessage(messageContent);
            userMessageMapper.insertMessage(message);

        } catch (NumberFormatException e) {
            // 处理转换失败的情况
            System.out.println("转换失败");
        } catch (Exception e) {
            // 其他异常处理
            e.printStackTrace();
        }


        // 发送给接收方
        String fromUserId = (String)param.get("fromUserId");
        System.out.println("---------------------------------------from User Id is:"+fromUserId);
        String toUserId = (String)param.get("toUserId");
        System.out.println("---------------------------------------to User Id is:"+toUserId);
        String content = (String)param.get("content");
        System.out.println("---------------------------------------content is:"+content);
        ChannelHandlerContext toUserCtx = Constant.onlineUserMap.get(toUserId);

        if (toUserCtx == null) {
            String responseJson = new ResponseJson()
                    .error(MessageFormat.format("userId为 {0} 的用户没有登录！", toUserId))
                    .toString();
            sendMessage(ctx, responseJson);
        } else {
            String responseJson = new ResponseJson().success()
                    .setData("fromUserId", fromUserId)
                    .setData("content", content)
                    .setData("type", ChatType.SINGLE_SENDING)
                    .toString();
            sendMessage(toUserCtx, responseJson);
        }
    }


    @Override
    public void remove(ChannelHandlerContext ctx) {
        Iterator<Entry<String, ChannelHandlerContext>> iterator =
                Constant.onlineUserMap.entrySet().iterator();
        while(iterator.hasNext()) {
            Entry<String, ChannelHandlerContext> entry = iterator.next();
            if (entry.getValue() == ctx) {
                LOGGER.info("正在移除握手实例...");
                Constant.webSocketHandshakerMap.remove(ctx.channel().id().asLongText());
                LOGGER.info(MessageFormat.format("已移除握手实例，当前握手实例总数为：{0}"
                        , Constant.webSocketHandshakerMap.size()));
                iterator.remove();
                LOGGER.info(MessageFormat.format("userId为 {0} 的用户已退出聊天，当前在线人数为：{1}"
                        , entry.getKey(), Constant.onlineUserMap.size()));
                break;
            }
        }
    }

    @Override
    public void FileMsgSingleSend(JSONObject param, ChannelHandlerContext ctx) {
        String fromUserId = (String)param.get("fromUserId");
        String toUserId = (String)param.get("toUserId");
        String originalFilename = (String)param.get("originalFilename");
        String fileSize = (String)param.get("fileSize");
        String fileUrl = (String)param.get("fileUrl");
        ChannelHandlerContext toUserCtx = Constant.onlineUserMap.get(toUserId);
        if (toUserCtx == null) {
            String responseJson = new ResponseJson()
                    .error(MessageFormat.format("userId为 {0} 的用户没有登录！", toUserId))
                    .toString();
            sendMessage(ctx, responseJson);
        } else {
            String responseJson = new ResponseJson().success()
                    .setData("fromUserId", fromUserId)
                    .setData("originalFilename", originalFilename)
                    .setData("fileSize", fileSize)
                    .setData("fileUrl", fileUrl)
                    .setData("type", ChatType.FILE_MSG_SINGLE_SENDING)
                    .toString();
            sendMessage(toUserCtx, responseJson);
        }
    }
    @Override
    public void typeError(ChannelHandlerContext ctx) {
        String responseJson = new ResponseJson()
                .error("该类型不存在！")
                .toString();
        sendMessage(ctx, responseJson);
    }

    private void sendMessage(ChannelHandlerContext ctx, String message) {
        ctx.channel().writeAndFlush(new TextWebSocketFrame(message));
    }

}
