package com.lmy.services.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityScan
public class GoodsReply {
    private Integer replyId;
    private Integer commentId;
    private Integer userId;
    private String avatarUrl;
    private String username;
    private String beReplyName;
    private String date;
    private String text;
    private String imageUrl;
}
