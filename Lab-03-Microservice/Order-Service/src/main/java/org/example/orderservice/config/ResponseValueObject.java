package org.example.orderservice.config;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.orderservice.entity.Customer;
import org.example.orderservice.entity.Employee;
import org.example.orderservice.entity.Order;
import org.example.orderservice.entity.Product;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseValueObject{
    private Customer customer;
    private Product product;
    private Employee employee;
    private Order order;
}