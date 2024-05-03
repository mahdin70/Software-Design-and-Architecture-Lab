package org.example.customerservice.repository;

import org.example.customerservice.entity.Customer;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CustomerRepository extends MongoRepository<Customer, String> {
    Customer findCustomerById(String customerId);
}
