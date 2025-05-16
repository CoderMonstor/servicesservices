package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminUser {
    private Integer userId;
    private String email;
    private String username;
    private String password;
    private String avatarUrl;
    private String bio;
    private String birthDay;
    private Integer gender;
    private String city;
    private String backImgUrl;
}
