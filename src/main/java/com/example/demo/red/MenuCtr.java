package com.example.demo.red;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/menu")
public class MenuCtr {

	private static Logger log = LoggerFactory.getLogger(MenuCtr.class);


	private MenuRepository repo;
	
	public MenuCtr(MenuRepository repo) {
		// this.svc = svc;
		this.repo = repo;
	}
	

	@GetMapping
	public String detail(Model model, @RequestParam Integer id) {
		log.trace("show menu detail");
		model.addAttribute("details", repo.findByCategoryId(id));
		return "/cart";
		
	}
}

