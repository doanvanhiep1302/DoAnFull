package com.example.ecommer.service;

import com.example.ecommer.dto.request.FilterProductRequest;
import com.example.ecommer.model.Product;
import com.example.ecommer.model.ProductHistory;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ProductService {

    List<Product> listProduct();

    Page<Product> findListProductPage(FilterProductRequest filterProductRequest);

    void saveProduct(Product category);

    void delete(Long id);

    void update(Product productRequest);

    Product findById(Long id);

    void  updateProductHistory(ProductHistory productHistory);
}
