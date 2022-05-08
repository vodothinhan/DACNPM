package service;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.DAOCustomer;

import java.util.Date;

@Service
public class Register {
    @Autowired
    DAOCustomer daoCustomer ;
    public  boolean checkExistEmail(String email){
        return daoCustomer.findByEmail(email).size()>0;
    }
    public void save(Customer customer){
        daoCustomer.save(customer);
    }


}
