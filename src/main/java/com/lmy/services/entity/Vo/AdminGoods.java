package com.lmy.services.entity.Vo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminGoods {
    private int goodsId;
    //类型 0：闲置 1：求购
    private String type;
    //商品名称
    private String goodsName;
    //商品描述
    private String goodsDesc;
    //价格
    private double goodsPrice;
    //姓名
    private String username;
    //图片
    private String image;
    //0：未出售 1：已出售
    private String sellStatus;

}
