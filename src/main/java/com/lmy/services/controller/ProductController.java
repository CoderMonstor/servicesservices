package com.lmy.services.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lmy.services.entity.Product;
import com.lmy.services.entity.ProductPage;
import com.lmy.services.entity.UserMsgList;
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

    @RequestMapping("/getAllProduct")
    public Result<List<ProductPage>> getUserMsgList(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<ProductPage> res = productService.getAllProduct(userId);
        PageInfo<ProductPage> pageInfo = new PageInfo<>(res);
        Result<List<ProductPage>> json;
        json = !res.isEmpty()
                ? new Result<List<ProductPage>>(res, "1", "获取到聊天记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }

    @RequestMapping("/getProductByUserId")
    public Result<List<Product>> getProductByUserId(Integer userId, Integer page) {
        PageHelper.startPage(page, 10);
        List<Product> res = productService.getProductByUserId(userId);
        PageInfo<Product> pageInfo = new PageInfo<>(res);
        Result<List<Product>> json;
        json = !res.isEmpty()
                ? new Result<List<Product>>(res, "1", "获取到聊天记录",pageInfo.getPages())
                : new Result<>(null, "0", "未找到数据",pageInfo.getPages());
        return json;
    }
}
