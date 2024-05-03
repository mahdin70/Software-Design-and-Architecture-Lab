package org.example.orderservice.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;

@AllArgsConstructor
@Data
@NoArgsConstructor
@ToString
public class OrderStatus {
    private Order order;
    private String status;
    private String message;
    private String productId;

}
