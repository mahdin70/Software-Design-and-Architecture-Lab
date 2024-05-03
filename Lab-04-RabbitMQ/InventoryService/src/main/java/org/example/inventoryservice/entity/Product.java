package org.example.inventoryservice.entity;

import lombok.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {
    private String id;
    private String name;
    private int qty;
}