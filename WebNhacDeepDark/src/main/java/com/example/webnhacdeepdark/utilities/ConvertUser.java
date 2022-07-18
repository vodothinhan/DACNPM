package com.example.webnhacdeepdark.utilities;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.security.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Component
public class ConvertUser {
    @Autowired
     private HashMD5 hashMD5 ;
    public Users toEntity(UserModel model){
            Users user = new Users() ;
            user.setEmail(model.getEmail());
            user.setCodeRecovery(null);
            hashMD5.setText(model.getPass());
            user.setPassword(hashMD5.md5ToBase64());
            user.setGender(model.getGender());
            user.setRole("USER");
            user.setStatus("ACTIVE");
            user.setTimeRecovery(System.currentTimeMillis());
            user.setDateOfBirth(formatDate(model));

        return  user ;

    }
    private Date formatDate(UserModel model){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String strDate = model.getDay()+"/"+model.getMonth()+"/"+model.getYear() ;
        Date  date = null ;
        try {
            date = formatter.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  date;
    }
}
