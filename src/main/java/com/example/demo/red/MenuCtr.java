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

	private CartRepository repoC;

	public MenuCtr(MenuRepository repo, CartRepository repoC) {
		this.repo = repo;
		this.repoC = repoC;
	}

	@GetMapping
	public String detail(Model model, @RequestParam Integer id) {
		log.trace("show menu detail");
		model.addAttribute("details", repo.findByCategoryId(id));
		return "/cart";

	}

	@GetMapping("/add")
	public String add(HttpSession session, @RequestParam Integer id, Model model) {
		log.trace("item added");
		Optional<Menu> menu = repo.findById(id);
		Menu item = menu.get();
		@SuppressWarnings("unchecked")
		List<Menu> items = (List<Menu>) session.getAttribute("items");
		if (items == null) {
			items = new ArrayList<>();
			session.setAttribute("items", items);
		}
		items.add(item);
		model.addAttribute("details",repo.findByCategoryId(id));
		return "/menu";
	}

}
