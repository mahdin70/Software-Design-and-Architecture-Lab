package org.example.inventoryservice.controller;
import org.example.inventoryservice.entity.Product;
import java.util.ArrayList;

public class InitializeProducts {
    public ArrayList<Product> initializeProducts() {
        ArrayList<Product> products = new ArrayList<>();
        products.add(new Product("123", "Laptop", 100));
        products.add(new Product("234", "Mouse", 50));
        products.add(new Product("345", "Keyboard", 10));
        products.add(new Product("456", "Monitor", 20));
        products.add(new Product("567", "CPU", 30));
        return products;
    }
}