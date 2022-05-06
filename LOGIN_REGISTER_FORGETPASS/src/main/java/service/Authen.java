package service;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.DAOCustomer;

import java.util.List;
@Service
public class Authen {
    @Autowired
    private DAOCustomer daoCustomer ;
    public boolean email(String email){
        List<Customer> list = daoCustomer.findByEmail(email) ;
        if(list.size()>0) return true ;
        return  false ;
    }
    public boolean pass(String pass){
        if(daoCustomer.findByPass(pass).size()>0) return true ;
        return  false;
    }


}
