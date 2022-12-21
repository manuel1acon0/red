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
	private OrderSvc svc;

	public MenuCtr(MenuRepository repo, CategoryRepository repoC, OrderSvc svc) {
		this.repo = repo;
		this.repoC = repoC;
		this.svc = svc;
	}

	@GetMapping
	public String detail(Model model, @RequestParam Integer id, HttpSession session) {
		log.trace("show menu detail");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		if (orders != null) {
			int result = orders.stream().mapToInt(o -> o.getQuantity()).sum();
			model.addAttribute("count", result);

		}
		try {
			model.addAttribute("details", repo.findByCategoryId(id));
			model.addAttribute("name", repoC.findById(id).get().getName());
		} catch (Exception ex) {
			log.error("Id not found");
			return "/category";
		}

		return "/menu";

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

	@GetMapping("/add")
	public String add(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("order added");

		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		try {

			model.addAttribute("details", repo.findByCategoryId(categoryId));
			model.addAttribute("name", repoC.findById(categoryId).get().getName());
		} catch (Exception ex) {
			log.error("Item could not be added");
			return "/category";
		}
		if (orders == null) {
			orders = new ArrayList<>();
			session.setAttribute("orders", orders);

		}
		int count = svc.add(id, orders);
		if (count == 0) {
			model.addAttribute("error", "Item does not exist");
		} else {
			model.addAttribute("count", count);
		}
		try {
			Optional<Order> order = svc.find(orders, id);
			model.addAttribute("quantity", order.get().getQuantity());
		} catch (Exception ex) {
			log.error("Item could not be added");

		}
		return "/menu";
	}

	@GetMapping("/remove")
	public String remove(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("Order removed");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		try {
			model.addAttribute("name", repoC.findById(categoryId).get().getName());
			model.addAttribute("details", repo.findByCategoryId(categoryId));
		} catch (Exception ex) {
			log.error("item could not be removed");
			return "/category";
		}
		try {
			model.addAttribute("count", svc.remove(id, orders));
		} catch (Exception ex) {
			log.error("item could not be removed");
		}

		return "/menu";
	}

	@GetMapping("/removeC")
	public String removeC(HttpSession session, @RequestParam Integer id, Model model) {
		log.trace("Order removed");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");

		svc.remove(id, orders);

		double sum = svc.sum(session);
		model.addAttribute("sum", sum);

		return "/cart";
	}

	@GetMapping("/removeAll")
	public String removeAll(HttpSession session, Model model) {
		log.trace("All orders removed");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		orders.clear();

		model.addAttribute("count", 0);
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}

	@GetMapping("/finish")
	public String finish(HttpSession session, Model model) {

		double sum = svc.sum(session);
		model.addAttribute("sum", sum);
		return "/cart";
	}

	@GetMapping("/addC")
	public String addC(HttpSession session, @RequestParam Integer id, Model model) {
		log.trace("order added");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		svc.add(id, orders);
		double sum = svc.sum(session);

		model.addAttribute("sum", sum);

		return "/cart";
	}

	@GetMapping("/removeProduct")
	public String removeProduct(Model model, HttpSession session, Integer id) {
		log.trace("Product removed");

		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		Optional<Order> opt = svc.find(orders, id);
		if (opt.isPresent()) {
			Order order = opt.get();

			orders.remove(order);
		}

		double sum = svc.sum(session);
		model.addAttribute("sum", sum);
		return "/cart";
	}

	@GetMapping("/home")
	public String home(Model model, HttpSession session, HttpSession session2) {
		log.trace("enter categories");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		if (orders != null) {
			int result = orders.stream().mapToInt(o -> o.getQuantity()).sum();
			model.addAttribute("count", result);
		}
		session2.setAttribute("categories", repoC.findAll());
		return "/category";
	}

	@GetMapping("/search")
	public String search(String name, Model model) {
		name = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
		model.addAttribute("details", repo.search(name));

		return "/menu";
	}
}
