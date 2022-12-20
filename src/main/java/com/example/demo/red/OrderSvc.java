package com.example.demo.red;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class OrderSvc {
	private MenuRepository repo;
	
	public OrderSvc(MenuRepository repo) {
		
		this.repo = repo;
	}
	public void remove(HttpSession session, @RequestParam Integer id) {
	
	@SuppressWarnings("unchecked")
	List<Order> orders = (List<Order>) session.getAttribute("orders");
	Optional<Order> opt = find(orders, id);
	if (opt.isPresent()) {
		Order order = opt.get();
		int quantity = order.getQuantity();
		if (quantity == 1) {
			orders.remove(order);
		} else {
			order.setQuantity(quantity - 1);
		}
	}
	
}
	public double sum (HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		double sum = 0;
		for (var order : orders) {

			sum = sum + order.getPrice() * order.getQuantity();

		}
		return sum;
	}
	public Optional<Order> find(List<Order> orders, Integer id) {
		for (Order order : orders) {
			if (order.getId() == id) {
				return Optional.of(order);
			}
		}
		return Optional.empty();
	}
	public boolean findId(Integer id, List<Order> orders) {
		for (var order : orders) {
			if (order.getId() == id) {
				order.setQuantity(order.getQuantity() + 1);
				return false;
			}
		}
		return true;
	}
	public void add(HttpSession session, @RequestParam Integer id,Model model) {
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		if (orders == null) {
			orders = new ArrayList<>();
			session.setAttribute("orders", orders);
		}
		Order order = null;
		if (findId(id, orders)) {
			Optional<Menu> opt = repo.findById(id);
			if (opt.isPresent()) {
				order = new Order(opt.get());
				order.setQuantity(1);
				orders.add(order);

			} else {
				model.addAttribute("error", "Item does not exist");
			}
		}
	}
	
}

