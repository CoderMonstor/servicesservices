package com.lmy.services.service;

import com.lmy.services.entity.Product;

import java.util.List;

public interface ProductService {
    Integer createProduct(Product product);

    List<Product> getAllProduct();

    List<Product> getProductByProductId(Integer productId);

    List<Product> getProductByUserId(Integer userId);

    List<Product> getProductsByCategory(Integer category);

}
