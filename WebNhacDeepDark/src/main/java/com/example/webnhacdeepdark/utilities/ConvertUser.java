package com.example.webnhacdeepdark.utilities;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.UserModel;
import org.springframework.stereotype.Component;

import java.security.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Component
public class ConvertUser {
    public Users toEntity(UserModel model){
            Users user = new Users() ;
            user.setEmail(model.getEmail());
            user.setCodeRecovery(null);
            user.setPassword(model.getPass());
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
