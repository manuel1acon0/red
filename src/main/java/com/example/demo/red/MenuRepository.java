package com.example.demo.red;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface MenuRepository extends CrudRepository<Menu, Integer> {

	@Query("select m from Menu m where m.categoryId = :categoryId")
	Iterable<Menu> findByCategoryId(Integer categoryId);

}