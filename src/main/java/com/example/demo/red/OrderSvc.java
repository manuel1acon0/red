package com.example.demo.red;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import org.springframework.web.bind.annotation.RequestParam;

@Service
public class OrderSvc {
	private MenuRepository repo;

	public OrderSvc(MenuRepository repo) {

		this.repo = repo;
	}

	public int remove(Integer id, List<Order> orders) {

//		@SuppressWarnings("unchecked")
//		List<Order> orders = (List<Order>) session.getAttribute("orders");
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
		return totalQuantity(orders);
	}

	public double sum(HttpSession session) {
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

	public int increase(Integer id, List<Order> orders) {
		for (var order : orders) {
			if (order.getId() == id) {
				int result = order.getQuantity() + 1;
				order.setQuantity(result);
				return result;
			}
		}
		return 0;
	}

	private Integer totalQuantity(List<Order> orders) {
		Integer sum = 0;
		for (var order : orders) {
			sum = sum + order.getQuantity();
		}
		return sum;
	}

	public int add(@RequestParam Integer id,List<Order> orders) {
//		@SuppressWarnings("unchecked")
//		List<Order> orders = (List<Order>) session.getAttribute("orders");

//		if (orders == null) {
//			orders = new ArrayList<>();
//			session.setAttribute("orders", orders);
//
//		}
		int increased = increase(id, orders);
		if (increased > 0) {
			return increased;
		} else {
			Optional<Menu> opt = repo.findById(id);
			if (opt.isPresent()) {
				Order order = new Order(opt.get());
				order.setQuantity(1);
				orders.add(order);
				return totalQuantity(orders);
			} else {
				return 0;
			}
		}
//		if (!increase(id, orders)) {
//			Optional<Menu> opt = repo.findById(id);
//			if (opt.isPresent()) {
//				Order order = new Order(opt.get());
//				order.setQuantity(1);
//				orders.add(order);
//				return totalQuantity(orders);
//			} else {
//				return 0;
//				
//			}
//		}
//		return 1;
	}

}
