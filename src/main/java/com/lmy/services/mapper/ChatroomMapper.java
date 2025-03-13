package com.lmy.services.mapper;



//public interface ChatroomMapper {
//    @Select("SELECT roomId FROM chatroom WHERE sender = #{sender} AND receiver = #{receiver}")
//    Integer findChatroomIdByUsers(@Param("sender") Integer sender, @Param("receiver") Integer receiver);
//
//    @Insert("INSERT INTO chatroom(sender, receiver) VALUES(#{sender}, #{receiver})")
//    @Options(useGeneratedKeys = true, keyProperty = "roomId")
//    void insertChatroom(Chatroom chatroom);
//
//    // 根据用户ID查找相关的聊天室ID
//    @Select("SELECT * FROM chatroom WHERE sender = #{userId} OR receiver = #{userId}")
//    @Results(id = "chatroomMap", value = {
//            @Result(id = true, property = "roomId", column = "roomId"),
//            @Result(property = "sender", column = "sender"),
//            @Result(property = "receiver", column = "receiver"),
//            @Result(property = "createdTime", column = "createdTime")
//    })
//    List<Chatroom> findChatroomIdByUserId(Integer userId);
//}

