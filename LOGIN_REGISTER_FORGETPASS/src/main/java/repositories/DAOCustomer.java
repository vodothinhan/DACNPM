package repositories;

import entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DAOCustomer extends JpaRepository<Customer , Integer> {
    public List<Customer> findByEmail(String email) ;
    public List<Customer> findByPass(String pass);
}
