package org.example.productservice.repository;

import org.example.productservice.entity.Product;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ProductRepository extends MongoRepository<Product, String> {
    Product findProductById(String productId);
}
