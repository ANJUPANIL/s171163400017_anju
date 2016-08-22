package com.niit.ecommercemain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class admin_controller {
	@RequestMapping(value="/adminhome")
	public ModelAndView adminhome()
	{
		String message="admin Home";
		return new ModelAndView("adminhome","message",message);
	}

}
