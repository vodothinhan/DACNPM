package service;


import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.DAOCustomer;

import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class OTP {
    @Autowired
    DAOCustomer daoCustomer ;
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
    public void updateCodeAndTime(String email,String code){
       List<Customer> customerList = daoCustomer.findByEmail(email);
        Customer customer =customerList.get(0);
        Date date = new Date();
        customer.setTime(date);
        customer.setCode(code);
        daoCustomer.save(customer);
    }
    public  boolean checkOTP(String otp ,String email){
        List<Customer> list = daoCustomer.findByEmail(email);
        Customer  customer = list.get(0);
        String code = customer.getCode();
        return code.equals(otp) ;
    }


}
