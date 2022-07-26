package com.example.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping("/v1")
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@GetMapping
	public String getHello() {
		return "Hello Rest API with Spring Microservice!";
	}
	
	@GetMapping("/{name}")
	public String welcome(@PathVariable String name) {
		return "Hi, " + name + " -- Welcome to AWS ECS Java example!";
	}
}
