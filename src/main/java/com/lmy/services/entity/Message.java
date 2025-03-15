package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.util.Date;
@Data
@EntityScan
public class Message {
    private Integer messageId;
    private Integer roomId;
    private Integer sender;
    private String message;
    private Date messageTime;

    // getters and setters
    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }
    public void setSender(Integer sender) {
        this.sender = sender;
    }
    public void setMessage(String message) {
        this.message = message;
    }
}
