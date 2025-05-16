package com.lmy.services.entity.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminPost {
    private Integer postId;
    private Integer userId;
    private String username;
    private String date;
    private String text;
    private String imageUrl;
    private Integer likeNum;
    private Integer forwardId;
    private String forwardName;
    private String forwardText;
    private String forwardImageUrl;
}
