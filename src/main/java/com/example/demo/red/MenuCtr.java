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

	@GetMapping("/add")
	public String add(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("item added");
		@SuppressWarnings("unchecked")
		List<Menu> items = (List<Menu>) session.getAttribute("items");
		if (items == null) {
			items = new ArrayList<>();
			session.setAttribute("items", items);
		}
		Optional<Menu> menu = repo.findById(id);
		if (menu.isPresent()) {

			Menu item = menu.get();

			items.add(item);

		} else {
			model.addAttribute("error", "Item does not exist");
		}

		model.addAttribute("count", items.size());
		model.addAttribute("details", repo.findByCategoryId(categoryId));
		return "/menu";
	}

	@GetMapping("/remove")
	public String remove(HttpSession session, @RequestParam Integer id, Model model, @RequestParam Integer categoryId) {
		log.trace("Item removed");
		@SuppressWarnings("unchecked")
		List<Menu> items = (List<Menu>) session.getAttribute("items");
		Optional<Menu> menu = repo.findById(id);
		Menu item = menu.get();
		items.remove(item);

		model.addAttribute("count", items.size());
		model.addAttribute("details", repo.findByCategoryId(categoryId));
		return "/menu";
	}

	@GetMapping("/removeAll")
	public String removeAll(HttpSession session, Model model) {
		log.trace("All items removed");
		@SuppressWarnings("unchecked")
		List<Menu> items = (List<Menu>) session.getAttribute("items");

		items.removeAll(items);

		model.addAttribute("count", items.size());
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}

//	@GetMapping("/sum")
//	public String sum(List<Menu> items,Model model) {
//		double sum=0;
//		for (var item : items) {
//			
//			sum = sum+item.getPrice();
//	}
//		model.addAttribute("sum", sum);
//		return"/cart";
//	}

	@GetMapping("/finish")
	public String finish(HttpSession session, Model model) {
		@SuppressWarnings("unchecked")
		List<Menu> items = (List<Menu>) session.getAttribute("items");

		double sum = 0;
		for (var item : items) {

			sum = sum + item.getPrice();

		}
		model.addAttribute("sum", sum);
		return "/cart";
	}
}
