package com.product.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/life")
	public @ResponseBody List<Product> life_list() {
		
		List<Product> products = prorep.findBy1("주방");
		
		return products;
	}
	
	@GetMapping("/food")
	public @ResponseBody List<Product> food_list() {
		
		List<Product> products = prorep.findBy1("음식");
		
		return products;
	}
	@GetMapping("/order")
	public @ResponseBody List<Product> order_list() {
		
		List<Product> products = prorep.findByOrder();
		
		return products;
	}
	@GetMapping("/price")
	public @ResponseBody List<Product> price_list() {
		
		List<Product> products = prorep.findByPrice();
		
		return products;
	}
	
	@GetMapping("/life_price")
	public @ResponseBody List<Product> life_price_list() {
		
		List<Product> products = prorep.findBy1Price();
		
		return products;
	}
	
	@GetMapping("/life_order")
	public @ResponseBody List<Product> life_order_list() {
		
		List<Product> products = prorep.findBy1Order();
		
		return products;
	}
	

	@GetMapping("/food_price")
	public @ResponseBody List<Product> food_price_list() {
		
		List<Product> products = prorep.findBy2Price();
		
		return products;
	}
	

	@GetMapping("/food_order")
	public @ResponseBody List<Product> food_order_list() {
		
		List<Product> products = prorep.findBy2Order();
		
		return products;
	}
}
