package com.lmy.services.service.impl;

import com.lmy.services.entity.Product;
import com.lmy.services.entity.ProductPage;
import com.lmy.services.mapper.ProductMapper;
import com.lmy.services.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductMapper productMapper;

    @Autowired
    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public Integer createProduct(Product product) {
        return productMapper.createProduct(product);
    }

    @Override
    public List<Product> getAllProduct() {
        return productMapper.getAllProduct();
    }

    @Override
    public List<Product> getProductByProductId(Integer productId) {
        return productMapper.getProductByProductId(productId);
    }

    @Override
    public List<Product> getProductByUserId(Integer userId) {
        return productMapper.getProductByUserId(userId);
    }

    public List<Product> getProductsByCategory(Integer category) {
        return productMapper.getProductsByCategory(category);
    }

}
