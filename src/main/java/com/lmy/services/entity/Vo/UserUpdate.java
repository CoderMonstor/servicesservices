package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserUpdate {
    private Integer userId;
    private String username;
    private String email;
    private String avatarUrl;
}
