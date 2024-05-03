package org.example.orderservice.controller;

import org.example.orderservice.config.ResponseValueObject;
import org.example.orderservice.entity.Order;
import org.example.orderservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @GetMapping("/{id}")
    public ResponseValueObject findOrderById(@PathVariable("id") String orderID){
        return orderService.getUserWithDepartment(orderID);
    }

    @PostMapping("/")
    public Order saveCustomer(@RequestBody  Order order){
        return orderService.saveOrder(order);
    }

}