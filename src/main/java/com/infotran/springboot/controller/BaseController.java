package com.infotran.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaseController {
	@GetMapping("/hello")
	public String hello(
		@RequestParam(value="name", required = false)	String visitor, Model model
			) {
		String message = visitor != null ? visitor + ", 您好" : "訪客, 早安"; 
		model.addAttribute("helloMessage", message);
		return "greeting";
	}
	
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PutMapping("/")
	public String putdata() {
		return "put";
	}	
	//111111111111111111111111111
	//222222222222222222
    //33333333333333333

	
	//new2/new2/new2/new2
	//new3new3vnew3

	//new1new1new1new1new1new1new1
	//22222222222222222222222
	//3333333333333333
	//444444444444444444
	//555555555555555555
	//666666666666666666
	//777777777777777
	//888888887878787

}
