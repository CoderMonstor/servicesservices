package com.lmy.services.service;

import com.lmy.services.entity.Product;
import com.lmy.services.entity.ProductPage;

import java.util.List;

public interface ProductService {
    List<ProductPage> getAllProduct(Integer userId);

    List<Product> getProductByUserId(Integer userId);
}
