package com.example.demo.red;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface MenuRepository extends CrudRepository <Menu,Integer>{

@Query("Select m from menu m where m.category_id= :categoryId ")
	Iterable<Menu> findByCategoryId(Integer categoryId);

}