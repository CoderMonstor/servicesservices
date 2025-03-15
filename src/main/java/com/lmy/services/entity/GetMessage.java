package com.lmy.services.entity;

import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan
public class GetMessage {

    private String message;
    private Integer senderType;


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getSenderType() {
        return senderType;
    }

    public void setSenderType(Integer senderType) {
        this.senderType = senderType;
    }
}
