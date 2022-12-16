package com.example.demo.red;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Menu {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "menu_id")
private Integer id;
private String name;
private String description;
private double price;
private Integer categoryId;


public Menu() {
	
}
public Menu(Integer id, String name, String description, double price, Integer categoryId) {
	this.categoryId=categoryId;
	this.id = id;
	this.name = name;
	this.description = description;
	this.price = price;
}

public Integer getCategoryId() {
	return categoryId;
}
public void setCategoryId(Integer categoryId) {
	this.categoryId = categoryId;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
@Override
public int hashCode() {
	return Objects.hash(categoryId, description, id, name, price);
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Menu other = (Menu) obj;
	return Objects.equals(categoryId, other.categoryId) && Objects.equals(description, other.description)
			&& Objects.equals(id, other.id) && Objects.equals(name, other.name)
			&& Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price);
}
@Override
public String toString() {
	return "Menu [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", categoryId="
			+ categoryId + "]";
}



}
