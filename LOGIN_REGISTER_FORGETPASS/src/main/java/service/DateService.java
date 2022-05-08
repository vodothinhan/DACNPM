package service;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.DAOCustomer;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class DateService {
@Autowired
    DAOCustomer daoCustomer ;
    public boolean checkTimerResetPass(long milliseconds ,String email){
        List<Customer> list = daoCustomer.findByEmail(email);
        Customer customer = list.get(0);
        Date from = customer.getTime();
        Calendar calendarFrom = Calendar.getInstance() ;
        Calendar calendarTo =Calendar.getInstance() ;
        calendarFrom.setTime(from);
        calendarTo.setTime(new Date());
        long timeSecond = (calendarTo.getTime().getTime()) - (calendarFrom.getTime().getTime());
        System.out.println(timeSecond+"huhu");
        return  timeSecond<milliseconds ;
    }
}
