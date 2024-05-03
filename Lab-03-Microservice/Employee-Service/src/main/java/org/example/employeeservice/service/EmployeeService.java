package org.example.employeeservice.service;

import org.example.employeeservice.entity.Employee;
import org.example.employeeservice.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    public Employee saveEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public Employee findEmployeeById(String userId) {
        return employeeRepository.findEmployeeById(userId);
    }
}