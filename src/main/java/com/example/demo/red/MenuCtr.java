package com.example.demo.red;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/red/menu")
public class MenuCtr {

	private static Logger log = LoggerFactory.getLogger(MenuCtr.class);

	private MenuRepository repo;
	
	@GetMapping ("/detail")
	public String Detail(Model model, @RequestParam Integer categoryId) {
		log.trace("show menu detail");
		model.addAttribute("details", repo.findByCategoryId(categoryId));
		return "/cart";
		
	}
}

