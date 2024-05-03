package org.example.employeeservice.repository;

import org.example.employeeservice.entity.Employee;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends MongoRepository<Employee, String> {
    Employee findEmployeeById(String userId);
}
