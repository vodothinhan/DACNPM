package config;

import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class OTP {
    public OTP(){}
    public String getOTP(){
        Random random = new Random();
        String otp  ="";
        for (int i =0 ; i<6 ; i++){
        int number = random.nextInt(10);
        otp +=number ;
        }
        return  otp ;
    }

}
