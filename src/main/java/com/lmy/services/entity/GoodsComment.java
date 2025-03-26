package com.lmy.services.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityScan
public class GoodsComment {

    private Integer commentId;
    private Integer userId;
    private Integer goodsId;
    private String avatarUrl;
    private String username;
    private String date;
    private String text;
    private String imageUrl;
    private Integer replyNum;
    private List<GoodsReply> goodsReplyList;

    @JsonIgnore
    public Integer getGoodsId() {
        return goodsId;
    }

}
