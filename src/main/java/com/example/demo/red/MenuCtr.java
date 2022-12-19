package com.example.demo.red;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuCtr {

	private static Logger log = LoggerFactory.getLogger(MenuCtr.class);

	private MenuRepository repo;

	private CategoryRepository repoC;

	public MenuCtr(MenuRepository repo, CategoryRepository repoC) {
		this.repo = repo;
		this.repoC = repoC;
	}

	@GetMapping
	public String detail(Model model, @RequestParam Integer id) {
		log.trace("show menu detail");
		model.addAttribute("details", repo.findByCategoryId(id));
		return "/menu";

	}

	public boolean findId(Integer id, List<Order> orders) {
		for (var order : orders) {
			if (order.getId() == id) {
				order.setQuantity(order.getQuantity()+1);
				return false;
			}
		}
		return true;
	}
	
	public Integer totalQuantity (List<Order> orders) {
		Integer sum=0;
		for (var order : orders) {
			sum=sum+order.getQuantity();
		}
		return sum;
	}
	
	public boolean findOrder(List<Order> orders) {
		for (var order : orders) {
			if (order.getQuantity() > 1) {
				order.setQuantity(order.getQuantity()-1);
				return false;
			}
		}
		return true;
	}

	@GetMapping("/add")
	public String add(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("order added");
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
		model.addAttribute("count", totalQuantity(orders));
		model.addAttribute("details", repo.findByCategoryId(categoryId));
		return "/menu";
	}

	@GetMapping("/remove")
	public String remove(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("Order removed");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		Optional<Menu> menu = repo.findById(id);
		Order order = new Order(menu.get());
		if (findOrder(orders)) {
			orders.remove(order);	
		}
		model.addAttribute("count", totalQuantity(orders));
		model.addAttribute("details", repo.findByCategoryId(categoryId));
		return "/menu";
	}

	@GetMapping("/removeAll")
	public String removeAll(HttpSession session, Model model) {
		log.trace("All orders removed");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");

		orders.removeAll(orders);

		model.addAttribute("count",totalQuantity(orders));
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}

	@GetMapping("/finish")
	public String finish(HttpSession session, Model model) {
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");

		double sum = 0;
		for (var order : orders) {

			sum = sum + order.getPrice()*order.getQuantity();

		}
		model.addAttribute("sum", sum);
		return "/cart";
	}
}
