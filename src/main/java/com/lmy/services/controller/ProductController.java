package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Product;
import com.lmy.services.service.ProductService;
import com.lmy.services.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {
    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("/createProduct")
    public Result<Integer> createProduct(Product product) {
        Integer res = productService.createProduct(product);
        Result<Integer> json;
        json = res > 0
                ? new Result<Integer>(res, "1", "创建成功")
                : new Result<>(null, "0", "创建失败");
        return json;
    }

    @RequestMapping("/getAllProduct")
    public Result<List<Product>> getUserMsgList(Integer page) {
        PageHelper.startPage(page, 10);
        List<Product> res = productService.getAllProduct();
        PageInfo<Product> pageInfo = new PageInfo<>(res);
        Result<List<Product>> json;
        json = !res.isEmpty()
                ? new Result<List<Product>>(res, "1", "获取到商品记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getProductByProductId")
    public Result<List<Product>> getProductByProductId(Integer productId) {
        List<Product> res = productService.getProductByProductId(productId);
        Result<List<Product>> json;
        json = !res.isEmpty()
                ? new Result<List<Product>>(res, "1", "获取到商品记录")
                : new Result<>(null, "0", "未找到数据");
        return json;
    }

    @RequestMapping("/getProductByUserId")
    public Result<List<Product>> getProductByUserId(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Product> res = productService.getProductByUserId(userId);
        PageInfo<Product> pageInfo = new PageInfo<>(res);
        Result<List<Product>> json;
        json = !res.isEmpty()
                ? new Result<List<Product>>(res, "1", "获取到商品记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getProductsByCategory")
    public Result<List<Product>> getProductsByCategory(Integer category, Integer page) {
        PageHelper.startPage(page, 10);
        List<Product> res = productService.getProductsByCategory(category);
        PageInfo<Product> pageInfo = new PageInfo<>(res);
        Result<List<Product>> json;
        json = !res.isEmpty()
                ? new Result<List<Product>>(res, "1", "获取到商品记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

}
