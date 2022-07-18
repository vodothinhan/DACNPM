package com.example.webnhacdeepdark.utilities;

import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;

@Service
public class HashMD5 {
    private String text ;
    private MessageDigest messageDigest ;

    public HashMD5(){
        try {
            this.messageDigest = MessageDigest.getInstance("MD5");
        } catch (Exception e){
            System.out.println("Algorithms not found ");
        }
    }
    public String md5ToBase64(){
        return Base64.getEncoder().encodeToString(getByte());
    }
    private byte [] getByte(){
        byte [] byteString = getText().getBytes(StandardCharsets.UTF_8);
        return messageDigest.digest(byteString);
    }
    public String getText(){
        return text ;
    }
    public void setText(String text){
        this.text = text ;
    }

}
