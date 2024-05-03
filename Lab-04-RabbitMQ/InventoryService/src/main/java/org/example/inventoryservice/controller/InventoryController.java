package org.example.inventoryservice.controller;

import org.example.inventoryservice.Constants;
import org.example.inventoryservice.entity.OrderStatus;
import org.example.inventoryservice.entity.Product;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class InventoryController {
    @Autowired
    private ProductService productService; // Assuming ProductService for handling product operations

    @RabbitListener(queues = Constants.QUEUE)
    public void consumeMessageFromQueue(OrderStatus orderStatus) {
        System.out.println("Message Received from queue: " + orderStatus);
        // Check product availability
        String productId = orderStatus.getProductId();
        Product product = productService.getProductById(productId);
        if (product != null && product.getQuantity() >= orderStatus.getOrder().getQty()) {
            System.out.println("Order can be fulfilled.");
            // You can proceed with further processing here
        } else {
            System.out.println("Insufficient product quantity. Order cannot be fulfilled.");
        }
    }
}
