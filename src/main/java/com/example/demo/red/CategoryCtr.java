package com.example.demo.red;

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
	private CategoryRepository repo;

	public CategoryCtr(CategoryRepository repo) {
		// this.svc = svc;
		this.repo = repo;
	}

	@GetMapping
	public String home(Model model) {
		log.trace("enter categories");
		model.addAttribute("categories", repo.findAll());
		return "/category";
	}
}
