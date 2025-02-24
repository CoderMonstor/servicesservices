package com.lmy.services.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
public class User implements Serializable {
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
    private Integer postNum;    //动态数量
    private Integer fanNum;     //粉丝数
    private Integer followNum;  //关注数
    private Integer isFollow;   //是否是查询者的关注

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }


    //转换json返回时忽略密码这个属性
    @JsonIgnore
    public String getPassword() {
        return password;
    }


    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", bio='" + bio + '\'' +
                ", birthDay='" + birthDay + '\'' +
                ", gender='" + gender + '\'' +
                ", city='" + city + '\'' +
                ", backImgUrl='" + backImgUrl + '\'' +
                ", postNum=" + postNum +
                ", fanNum=" + fanNum +
                ", followNum=" + followNum +
                ", isFollow=" + isFollow +
                '}';
    }
}