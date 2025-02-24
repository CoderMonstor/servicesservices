package com.lmy.services.utils;

import org.springframework.stereotype.Component;
/*
生成随机验证码
 */
@Component
public class RandomCodeUtil {
    //获取随机的验证码
    public  String getRandomCode() {
        String[] letters = new String[] {"0","1","2","3","4","5","6","7","8","9"};
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            code.append(letters[(int) Math.floor(Math.random() * letters.length)]);
        }
        return code.toString();
    }
}
