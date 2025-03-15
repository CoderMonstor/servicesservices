package com.lmy.services.mapper;

import com.lmy.services.entity.Product;
import com.lmy.services.entity.ProductPage;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductMapper {
    @Select("SELECT " +
            "  productId," +
            "  images AS productImage," +
            "  title AS productName," +
            "  description," +
            "  price " +
            "FROM product " +
            "WHERE status = 1 " +
            "ORDER BY create_time DESC " +
            "LIMIT 10 OFFSET 0")
    List<ProductPage> getAllProduct(Integer userId);

//    @Select("SELECT " +)
    List<Product> getProductByUserId(Integer userId);
}
