package com.example.webnhacdeepdark.utilities;

import org.springframework.stereotype.Component;

import java.util.Random;
@Component
public class RenderOTP {
    private String code ;
    public String createOTP(){
        Random random = new Random();
        String otp  ="";
        for (int i =0 ; i<6 ; i++){
            int number = random.nextInt(10);
            otp +=number ;
        }
        this.code = otp ;
        return  otp ;
    }
    public String getCode(){
        return code ;
    }
}
