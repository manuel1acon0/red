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
	
//	@RequestMapping("/red/show")
//	public String show (Model model,Integer categoryId) {
//		repo.find
//		return
//	}
	
//
//	@GetMapping("/delete")
//	public String delete(@RequestParam Integer id, Model model) {
//		log.trace("delete contact");
//		Optional<Contact> contatto = repo.findById(id);
//		contatto.ifPresentOrElse(c -> repo.delete(c), () -> model.addAttribute("badId", id));
//		model.addAttribute("contacts", repo.findAll());
//		return "/Manuel/telefono";
//	}
//
//	@GetMapping("/insert")
//	public String inserisci(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String number,
//			Model model) {
//		log.trace("enter insert");
//
//		Contact contatto = new Contact(firstName, lastName, number);
//		if (firstName.isBlank() || lastName.isBlank() || number.isBlank()) {
//			model.addAttribute("badContact", contatto);
//			
//		} else {
//			try {
//				repo.save(contatto);
//			} catch (Exception e) {
//
//				log.error("Something went wrong", e);
//				model.addAttribute("badContact", contatto);
//				repo.findAll();
//			}
//			
//
//			// svc.add(contatto);
//			// model.addAttribute("contacts", svc.getAll());
//		}
//		model.addAttribute("contacts", repo.findAll());
//		return "/Manuel/telefono";
//	}
//
	@GetMapping
	public String home(Model model) {
		log.trace("enter categories");
		model.addAttribute("categories", repo.findAll());
		return "/menu";
	}
//	@GetMapping("/modify")
//	public String modifica(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String number,
//			@RequestParam Integer id, Model model) {
//		log.trace("enter modify");
//		Optional<Contact> contatto = repo.findById(id);
//		Contact contattoNew = new Contact(firstName, lastName, number);
//		return "/Manuel/telefono";
//	}
}
