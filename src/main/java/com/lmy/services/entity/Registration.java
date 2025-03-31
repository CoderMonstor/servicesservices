package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.sql.Timestamp;

@Data
@EntityScan
public class Registration {
    // 报名ID（主键）
    private Integer registrationId;

    // 用户ID
    private Integer userId;

    // 活动ID
    private Integer activityId;

    // 报名人数
    private Integer participants = 1;

    // 报名时间（DATETIME）
    private Timestamp registrationTime;

    // 状态：1-有效，0-已取消
    private Integer status = 1;

    // 创建时间（TIMESTAMP）
    private Timestamp createTime;

    // 更新时间（TIMESTAMP）
    private Timestamp updateTime;


    @Override
    public String toString() {
        return "Registration{" +
                "registrationId=" + registrationId +
                ", userId=" + userId +
                ", activityId=" + activityId +
                ", participants=" + participants +
                ", registrationTime=" + registrationTime +
                ", status=" + status +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}