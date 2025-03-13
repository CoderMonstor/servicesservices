package com.lmy.services.mapper;

import com.lmy.services.entity.Chatroom;
import com.lmy.services.entity.Message;
import com.lmy.services.entity.MsgUserList;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserMessageMapper {
    @Select("SELECT other_user.avatarUrl AS imageUrl, " +
            "       other_user.username AS name, " +
            "       m.message, " +
            "       m.messageTime AS time " +
            "FROM chatroom cr " +
            "JOIN user other_user ON " +
            "    CASE " +
            "        WHEN cr.sender = #{userId} THEN cr.receiver " +
            "        ELSE cr.sender " +
            "    END = other_user.userId " +
            "JOIN ( " +
            "    SELECT " +
            "        roomId, " +
            "        MAX(messageTime) AS latest_time " +
            "    FROM message " +
            "    GROUP BY roomId " +
            ") latest ON cr.roomId = latest.roomId " +
            "JOIN message m ON " +
            "    m.roomId = latest.roomId " +
            "    AND m.messageTime = latest.latest_time " +
            "WHERE " +
            "    #{userId} IN (cr.sender, cr.receiver) " +
            "ORDER BY time DESC")
        List<MsgUserList> getMsgUserList(@Param("userId") int userId);

        @Select("SELECT roomId FROM chatroom WHERE sender = #{sender} AND receiver = #{receiver}")
        Integer findChatroomIdByUsers(@Param("sender") Integer sender, @Param("receiver") Integer receiver);

        @Insert("INSERT INTO chatroom(sender, receiver) VALUES(#{sender}, #{receiver})")
        @Options(useGeneratedKeys = true, keyProperty = "roomId")
        void insertChatroom(Chatroom chatroom);

        @Insert("INSERT INTO message(roomId, sender, message) VALUES(#{roomId}, #{sender}, #{message})")
        @Options(useGeneratedKeys = true, keyProperty = "messageId")
        void insertMessage(Message message);

        // 根据用户ID查找相关的聊天室ID
        @Select("SELECT * FROM chatroom WHERE sender = #{userId} OR receiver = #{userId}")
        @Results(id = "chatroomMap", value = {
                @Result(id = true, property = "roomId", column = "roomId"),
                @Result(property = "sender", column = "sender"),
                @Result(property = "receiver", column = "receiver"),
                @Result(property = "createdTime", column = "createdTime")
        })
        List<Chatroom> findChatroomIdByUserId(Integer userId);
}
