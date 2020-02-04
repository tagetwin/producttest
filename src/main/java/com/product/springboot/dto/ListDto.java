package com.product.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListDto {
	
	private int id;
	private String name;
	private int price;
	private int orderCount;
	private String type;
	
}
