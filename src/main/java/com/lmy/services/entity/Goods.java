package com.lmy.services.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@TableName("goods")
public class Goods {
     //商品id
    @TableId(type = IdType.AUTO)
    private int goodsId;
    //发布人id
    private int userId;
    //订单id
    @TableField(exist = false)
    private int orderId;
    //分类id
    private int categoryId;
    //类型 0：闲置 1：求购
    private String type;
    //商品名称
    private String goodsName;
    //商品描述
    private String goodsDesc;
    //价格
    private BigDecimal goodsPrice;
    //交易价格
    @TableField(exist = false)
    private BigDecimal price;
    //发布/求购地址
    private String address;
    //图片
    private String image;
    //状态 0：上架 1：下架
    private String status;
    //0：未出售 1：已出售
    private String sellStatus;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    //收藏id
    @TableField(exist = false)
    private int collectId;
    //交易时间
    @TableField(exist = false)
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date sellTime;
}
