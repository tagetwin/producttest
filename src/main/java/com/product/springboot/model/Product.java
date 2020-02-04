package com.product.springboot.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Product {

	private int id;
	private String name;
	private int price;
	private int orderCount;
	private String type;

	@Builder
	public Product(String name, int price, int orderCount, String type) {
		this.name = name;
		this.price = price;
		this.orderCount = orderCount;
		this.type = type;
	}
	
	
}
