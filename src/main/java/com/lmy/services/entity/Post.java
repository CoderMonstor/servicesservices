package com.lmy.services.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityScan
public class Post implements Serializable {

    private Integer postId;
    private Integer userId;
    private String username;
    private String date;
    private String text;
    private String imageUrl;
    private String avatarUrl;
    private Integer likeNum;
    private Integer commentNum;
    private Integer forwardNum;
    private Integer isLiked;
    private Integer isStar;
    private Integer forwardId;
    private String forwardName;
    private String forwardText;
    private String forwardImageUrl;

    public Integer getForwardId() {
        return forwardId;
    }
}

