package com.lmy.services.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityScan
public class Comment implements Serializable {
    private Integer commentId;
    private Integer userId;
    private Integer postId;
    private String avatarUrl;
    private String username;
    private String date;
    private String text;
    private String imageUrl;
    private Integer isLiked;
    private Integer likeNum;
    private Integer replyNum;
    private List<Reply> replyList;


    @JsonIgnore
    public Integer getPostId() {
        return postId;
    }

}


