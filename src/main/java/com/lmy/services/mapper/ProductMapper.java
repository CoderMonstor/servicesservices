package com.lmy.services.mapper;

import com.lmy.services.entity.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductMapper {
    @Insert("INSERT INTO product (userId, title, description, images, price, location, category, status, createTime) " +
            "VALUES (#{userId}, #{title}, #{description}, #{images}, #{price}, #{location}, #{category}, #{status}, #{createTime})")
    @Options(useGeneratedKeys = true, keyProperty = "productId")
    Integer createProduct(Product product);


    @Select("SELECT productId, images, title, description, price FROM product WHERE status = 1 ORDER BY createTime DESC")
    @Results({
            @Result(column = "productId", property = "productId"),
            @Result(column = "images", property = "images"),
            @Result(column = "title", property = "title"),
            @Result(column = "description", property = "description"),
            @Result(column = "price", property = "price")
    })
    List<Product> getAllProduct();

    @Select("SELECT " +
            "    p.productId, " +
            "    p.userId AS product_userId, " +
            "    u.userId AS user_userId, " +
            "    u.avatarUrl, " +
            "    u.username, " +
            "    p.title, " +
            "    p.description, " +
            "    p.images, " +
            "    p.price, " +
            "    p.location, " +
            "    p.category, " +
            "    p.status, " +
            "    p.createTime " +
            "FROM product p " +
            "LEFT JOIN user u ON p.userId = u.userId " +
            "WHERE p.productId = #{productId}")
    @Results({
            @Result(property = "productId", column = "productId"),
            @Result(property = "userId", column = "product_userId"),
            @Result(property = "username", column = "username"), // 映射 username
            @Result(property = "avatarUrl", column = "avatarUrl"), // 映射 avatarUrl
            @Result(property = "title", column = "title"),
            @Result(property = "description", column = "description"),
            @Result(property = "images", column = "images"),
            @Result(property = "price", column = "price"),
            @Result(property = "location", column = "location"),
            @Result(property = "category", column = "category"),
            @Result(property = "status", column = "status"),
            @Result(property = "createTime", column = "createTime")
    })
    List<Product> getProductByProductId(@Param("productId") Integer productId);

    @Select("SELECT " +
            "    p.productId, " +
            "    p.userId AS product_userId, " +
            "    u.userId AS user_userId, " +
            "    u.avatarUrl, " +
            "    u.username, " +
            "    p.title, " +
            "    p.description, " +
            "    p.images, " +
            "    p.price, " +
            "    p.location, " +
            "    p.category, " +
            "    p.status, " +
            "    p.createTime " +
            "FROM product p " +
            "LEFT JOIN user u ON p.userId = u.userId " +
            "WHERE p.userId = #{userId}")
    @Results({
            @Result(property = "productId", column = "productId"),
            @Result(property = "userId", column = "product_userId"),
            @Result(property = "username", column = "username"), // 映射 username
            @Result(property = "avatarUrl", column = "avatarUrl"), // 映射 avatarUrl
            @Result(property = "title", column = "title"),
            @Result(property = "description", column = "description"),
            @Result(property = "images", column = "images"),
            @Result(property = "price", column = "price"),
            @Result(property = "location", column = "location"),
            @Result(property = "category", column = "category"),
            @Result(property = "status", column = "status"),
            @Result(property = "createTime", column = "createTime")
    })
    List<Product> getProductByUserId(@Param("userId") Integer userId);

    @Select("SELECT " +
            "    p.productId, " +
            "    p.userId AS product_userId, " +
            "    u.userId AS user_userId, " +
            "    u.avatarUrl, " +
            "    u.username, " +
            "    p.title, " +
            "    p.description, " +
            "    p.images, " +
            "    p.price, " +
            "    p.location, " +
            "    p.category, " +
            "    p.status, " +
            "    p.createTime " +
            "FROM product p " +
            "LEFT JOIN user u ON p.userId = u.userId " +
            "WHERE p.category = #{category}")
    @Results({
            @Result(property = "productId", column = "productId"),
            @Result(property = "userId", column = "product_userId"),
            @Result(property = "username", column = "username"), // 映射 username
            @Result(property = "avatarUrl", column = "avatarUrl"), // 映射 avatarUrl
            @Result(property = "title", column = "title"),
            @Result(property = "description", column = "description"),
            @Result(property = "images", column = "images"),
            @Result(property = "price", column = "price"),
            @Result(property = "location", column = "location"),
            @Result(property = "category", column = "category"),
            @Result(property = "status", column = "status"),
            @Result(property = "createTime", column = "createTime")
    })
    List<Product> getProductsByCategory(@Param("category") Integer category);

}
