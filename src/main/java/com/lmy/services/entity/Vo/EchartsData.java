package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EchartsData {
    private Integer totalPosts;       // 帖子总数
    private Integer totalGoods;       // 商品总数
    private Integer totalActivities;  // 活动总数
    private Integer totalUsers;       // 用户总数
    private Integer maleUsers;        // 男性用户数
    private Integer femaleUsers;      // 女性用户数
    private Integer unknownGender;    // 性别未设置的用户数
    private Integer onSaleGoods;      // 在售商品数
    private Integer soldOutGoods;     // 已售商品数
    private Integer canceledActivities;  // 已取消活动数
    private Integer enrollActivities;       // 进行中活动数
    private Integer endedActivities;        ///  已结束活动数
}
