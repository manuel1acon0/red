package com.example.demo.red;

import java.util.List;

import javax.servlet.http.HttpSession;

//import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;

//import com.example.demo.red.Category;
//import com.example.demo.red.Menu;
@Controller
@RequestMapping("/red")
public class CategoryCtr {
	private static Logger log = LoggerFactory.getLogger(CategoryCtr.class);
	// private ManuelPhoneSvc svc;
	private CategoryRepository repoC;

	public CategoryCtr(CategoryRepository repoC) {
		// this.svc = svc;
		this.repoC = repoC;
	}

	@GetMapping
	public String home(Model model,HttpSession session) {
		log.trace("enter categories");
		@SuppressWarnings("unchecked")
		List<Order> orders = (List<Order>) session.getAttribute("orders");
		session.addAttrinute("count",totalQuantity(orders) );
		model.addAttribute("categories", repoC.findAll());
		return "/category";
	}
}
