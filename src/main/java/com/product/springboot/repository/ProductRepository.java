package com.product.springboot.repository;

import java.util.List;

import com.product.springboot.model.Product;

public interface ProductRepository {

	// 전체검색
		List<Product> findAll();
		
		// 주방
		List<Product> findBy1(String type);
		
		// 음식
		List<Product> findBy2(String type);
		
		// 가격순
		List<Product> findByPrice();
		
		// 주문순
		List<Product> findByOrder();
}
