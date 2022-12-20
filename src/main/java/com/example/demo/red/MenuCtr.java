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
	public String detail(Model model, @RequestParam Integer id, HttpSession session,@RequestParam String name) {
		log.trace("show menu detail");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		if (orders != null) {
			model.addAttribute("count", totalQuantity(orders));
		}
		model.addAttribute("name", name);
		model.addAttribute("details", repo.findByCategoryId(id));
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

	public Integer totalQuantity(List<Order> orders) {
		Integer sum = 0;
		for (var order : orders) {
			sum = sum + order.getQuantity();
		}
		return sum;
	}

	private Optional<Order> find(List<Order> orders, Integer id) {
		for (Order order : orders) {
			if (order.getId() == id) {
				return Optional.of(order);
			}
		}
		return Optional.empty();
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

		model.addAttribute("count", totalQuantity(orders));
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}

	@GetMapping("/finish")
	public String finish(HttpSession session, Model model) {
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");

		double sum = 0;
		for (var order : orders) {

			sum = sum + order.getPrice() * order.getQuantity();

		}
		model.addAttribute("sum", sum);
		return "/cart";
	}

	@GetMapping("/removeC")
	public String removeC(HttpSession session, @RequestParam Integer id, Model model
			) {
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

		return "/cart";
	}

	@GetMapping("/addC")
	public String addC(HttpSession session, @RequestParam Integer id, Model model) {
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

		return "cart";
	}

//	@GetMapping("/cartM")
//	public String cartM(Model model, HttpSession session) {
//		log.trace("Returning to menu");
//		@SuppressWarnings("unchecked")
//		List<Order> orders = (List<Order>) session.getAttribute("orders");
//		model.addAttribute("count", totalQuantity(orders));
//		model.addAttribute("details", repoC.findAll());
//		return "/category";
//	}

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		log.trace("enter categories");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		if (orders != null) {
			model.addAttribute("count", totalQuantity(orders));
		}
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}
}
