package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminActivity {
    private Integer activityId;
    //活动状态
    private String status;
    // 主办用户ID
    private String username;
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
    // 活动详情（富文本）
    private String details;
}
