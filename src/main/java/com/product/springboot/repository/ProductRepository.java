package com.product.springboot.repository;

import java.util.List;

import com.product.springboot.model.Product;

public interface ProductRepository {

	// 전체검색
	List<Product> findAll();

	// 주방 or 음식
	List<Product> findByType(String type);
	
	// 주문 or 가격
	List<Product> findBySort(String sort);

	// 타입 + 주문
	List<Product> findByOrderType(String type);

	// 타입 + 가격
	List<Product> findByPriceType(String type);

}
