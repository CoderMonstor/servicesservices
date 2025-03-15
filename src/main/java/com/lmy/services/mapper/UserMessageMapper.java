package com.lmy.services.mapper;

import com.lmy.services.entity.Chatroom;
import com.lmy.services.entity.GetMessage;
import com.lmy.services.entity.Message;
import com.lmy.services.entity.UserMsgList;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMessageMapper {
    @Select("SELECT other_user.avatarUrl AS imageUrl, " +
            "       other_user.username AS name, " +
            "       m.message AS msg, " +
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
        List<UserMsgList> getMsgUserList(@Param("userId") int userId);


        @Select("SELECT roomId FROM chatroom WHERE sender = #{sender} AND receiver = #{receiver}")
        Integer findChatroomIdByUsers(@Param("sender") Integer sender, @Param("receiver") Integer receiver);


        @Insert("INSERT INTO message(roomId, sender, message) VALUES(#{roomId}, #{sender}, #{message})")
        @Options(useGeneratedKeys = true, keyProperty = "messageId")
        void insertMessage(Message message);



    @Select("SELECT roomId FROM chatroom WHERE sender = #{sender} AND receiver = #{receiver}")
    Integer getChatRoomId(@Param("sender") Integer sender, @Param("receiver") Integer receiver);

    @Insert("INSERT INTO chatroom (sender, receiver) VALUES (#{sender}, #{receiver})")
    @Options(useGeneratedKeys = true, keyProperty = "roomId")
    void insertChatRoom(Chatroom chatroom);

    @Select("SELECT " +
            "    CASE " +
            "        WHEN c.sender = #{userId} THEN u2.avatarUrl " +
            "        ELSE u1.avatarUrl " +
            "    END AS imageUrl, " +
            "    CASE " +
            "        WHEN c.sender = #{userId} THEN u2.username " +
            "        ELSE u1.username " +
            "    END AS name, " +
            "    MAX(m.message) AS msg, " +
            "    MAX(m.messageTime) AS time " +
            "FROM chatroom c " +
            "JOIN user u1 ON c.sender = u1.userId " +
            "JOIN user u2 ON c.receiver = u2.userId " +
            "LEFT JOIN ( " +
            "    SELECT " +
            "        roomId, " +
            "        message, " +
            "        messageTime " +
            "    FROM message " +
            "    WHERE roomId IN ( " +
            "        SELECT roomId " +
            "        FROM chatroom " +
            "        WHERE sender = #{userId} OR receiver = #{userId} " +
            "    ) " +
            "    ORDER BY messageTime DESC " +
            ") m ON m.roomId = c.roomId " +
            "WHERE " +
            "    c.sender = #{userId} OR c.receiver = #{userId} " +
            "GROUP BY " +
            "    c.roomId, u1.userId, u2.userId")
    List<UserMsgList> getUserMsgList(@Param("userId") int userId);


    @Select("SELECT " +
            "    m.message AS message, " +
            "    CASE " +
            "        WHEN m.sender = #{sender} THEN 1 " +
            "        ELSE 2 " +
            "    END AS senderType " +
            "FROM " +
            "    message m " +
            "WHERE " +
            "    m.roomId = ( " +
            "        SELECT roomId " +
            "        FROM chatroom " +
            "        WHERE " +
            "            sender = LEAST(#{sender}, #{receiver}) " +
            "            AND receiver = GREATEST(#{sender}, #{receiver}) " +
            "    ) " +
            "ORDER BY " +
            "    m.messageTime ASC")
    List<GetMessage> getMsg(@Param("sender") Integer sender, @Param("receiver") Integer receiver);
}
