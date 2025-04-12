package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@EntityScan
public class Activities implements Serializable {
    // 活动ID
    private Integer activityId;
    //活动状态
    private String status;
    // 主办用户ID
    private Integer hostUserId;
    // 活动名称
    private String activityName;
    // 封面图URL
    private String activityImage;
    // 活动时间
    private Timestamp activityTime;
    // 活动地点
    private String location;
    // 最大参与人数
    private Integer maxParticipants;
    // 当前报名人数
    private Integer currentParticipants;
//    // 活动简介
//    private String content;
    // 活动详情（富文本）
    private String details;
    // 创建时间
    private Timestamp createTime;
    // 更新时间
    private Timestamp updateTime;
    // 是否已报名
    private Integer isRegistered;
}

