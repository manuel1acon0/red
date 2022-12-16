package com.example.demo.red;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface CartRepository extends CrudRepository <Cart,Integer>{

	@Query("select name, price from Menu m")
	Iterable<Cart> menuFilter();	
}

