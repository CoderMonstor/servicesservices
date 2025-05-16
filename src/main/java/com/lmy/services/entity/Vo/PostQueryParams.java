package com.lmy.services.entity.Vo;

import lombok.Data;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Data
public class PostQueryParams {
    private Integer page;
    private Integer size;
    private String title;
    private String username;
    private Date startDate;
    private Date endDate;
    private String sortField = "create_time";
    private String sortOrder = "desc";

    // 校验排序字段的白名单（在Getter中直接返回校验后的值）
    public String getSortField() {
        List<String> allowedFields = Arrays.asList("create_time", "like_num", "forward_id");
        String field = sortField != null ? sortField.toLowerCase() : "create_time";
        return allowedFields.contains(field) ? field : "create_time";
    }

    public String getSortOrder() {
        return sortOrder != null && sortOrder.equalsIgnoreCase("asc") ? "asc" : "desc";
    }
}
