package com.example.demo.red;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface MenuRepository extends CrudRepository<Menu, Integer> {

	@Query("select m from Menu m where m.categoryId = :id")
	Iterable<Menu> findByCategoryId(Integer id);
	@Query("select name, price from Menu m")
	Iterable<Cart> menuFilter();	

}