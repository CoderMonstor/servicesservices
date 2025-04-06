package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;


import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


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
    private String username;
    private String avatarUrl;
    private String replyContent;
    private int depth;
    private String replyTo;

    private List<Discuss> children = new ArrayList<>();
}

