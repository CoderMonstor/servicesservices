package com.lmy.services.entity;

import lombok.Data;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.io.Serializable;
import java.sql.Timestamp;
@Data
@EntityScan
public class Hits implements Serializable {

    private Integer hitsId;

    private Integer userId;

    private Integer activityId;

    private Timestamp createTime;

    private Timestamp updateTime;
}

