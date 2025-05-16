package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetail {
    private Integer userId;
    private String email;
    private String username;
    private String avatarUrl;
    private String bio;
    private String birthDay;
    private Integer gender;
    private String city;
    private String backImgUrl;
    private Integer followNum;
    private Integer fansNum;
    private Integer postNum;
    private Integer goodsNum;
    private Integer activityNum;
}
