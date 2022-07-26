package com.example.rest;

import java.time.LocalDate;

public class Person {
	private String name;
	private LocalDate dateOfBirth;
	private String email;
	@Override
	public String toString() {
		return "Person [name=" + name + ", dateOfBirth=" + dateOfBirth + ", email=" + email + "]";
	}

}
