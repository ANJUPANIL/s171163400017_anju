package com.niit.ecommercemain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.service.*;

@Controller
public class category_opt_controller {
	@Autowired
	category_srv cs;
	
	category_srv_impl obj=new category_srv_impl();
	@RequestMapping(value= "/")
	public String indexpage(){
		System.out.println("Controller");
		return "index";
	}
	@RequestMapping(value= "/savesupplier")
	public String savesupplier(){
		
		
		category c = new category();
		c.setId("1");
		c.setName("tablets");
		c.setDes("Tablets");
		cs.savecategory(c);
		
		
		return "index";
	}

	
	

}
