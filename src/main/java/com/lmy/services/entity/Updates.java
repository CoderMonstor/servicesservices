package com.lmy.services.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.domain.EntityScan;
@Data
@NoArgsConstructor
@AllArgsConstructor
@EntityScan
public class Updates {
    private String version;
    private String content;
    private String androidUrl;
    private String iosUrl;
    private String date;

}
