package com.product.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.springboot.model.Product;
import com.product.springboot.repository.ProductRepository;

@Controller
public class HomeController {

	@Autowired
	private ProductRepository prorep;

	@GetMapping({"/",""})
	public String home(Model model) {
		
		List<Product> products = prorep.findAll();
		model.addAttribute("products", products);
		
		return "home";
	}
	
	@GetMapping("/all")
	public @ResponseBody List<Product> all_list() {
		
		List<Product> products = prorep.findAll();
		
		return products;
	}
	
	@GetMapping("/type/{type}")
	public @ResponseBody List<Product> type_list(@PathVariable String type) {
		
		List<Product> products = prorep.findByType(type);
		
		return products;
	}
	
	@GetMapping("/sort/{sort}")
	public @ResponseBody List<Product> order_list(@PathVariable String sort) {
		
		List<Product> products = prorep.findBySort(sort);
		
		return products;
	}
	
	
	@GetMapping("/order/{type}")
	public @ResponseBody List<Product> order_type_list(@PathVariable String type) {
		
		List<Product> products = prorep.findByOrderType(type);
		
		return products;
	}
	
	@GetMapping("/price/{type}")
	public @ResponseBody List<Product> price_type_list(@PathVariable String type) {
		
		List<Product> products = prorep.findByPriceType(type);
		
		return products;
	}

}
