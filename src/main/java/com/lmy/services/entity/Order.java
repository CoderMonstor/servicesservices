package com.lmy.services.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("goodsOrder")
public class Order {
    private Integer goodsId;
    private Integer buyer;
}
