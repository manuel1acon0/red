package com.example.demo.red;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class OrderSvc {
	public String removeC(HttpSession session, @RequestParam Integer id, Model model,
			@RequestParam Integer categoryId) {
	log.trace("Order removed");
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
}
