package com.lmy.services.entity;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 活动点赞实体（对应数据库表 praise）
 */
@Data
public class Praise implements Serializable {

    private Integer praiseId;
    private Integer userId;
    private Integer activityId;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer status = 1;
}
