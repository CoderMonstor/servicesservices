package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;


import java.io.Serializable;
import java.sql.Timestamp;


@Data
@EntityScan
public class Discuss implements Serializable {
    private Integer discussId;
    private Integer userId;
    private Integer activityId;
    private Integer replyId;
    private Integer parentId;
    private String content;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String nickname;
    private String avatarUrl;
}

