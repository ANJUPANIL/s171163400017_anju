package com.niit.ecommercemain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class index_controller {
	
	@RequestMapping(value= "/")
	public String indexpage(){
		System.out.println("Controller");
		return "index";
	}


	@RequestMapping(value="/contactus")
	public String contactus()
	{
		System.out.println("inside contact controller");
		return "contactus";
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login()
	{
		ModelAndView mv=new ModelAndView("login");
		mv.addObject("User click Login",true);
		return mv;
	}
	@RequestMapping(value="/registration")
	public ModelAndView registration()
	{
		ModelAndView mv=new ModelAndView("registration");
		mv.addObject("User click register",true);
		return mv;
	}
	

}
