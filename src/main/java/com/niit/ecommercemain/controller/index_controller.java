package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.product_srv;

@Controller
public class index_controller {
	
	
	@Autowired
	category_srv catsrv;
	
	@Autowired
	product_srv ps;
	
	@RequestMapping(value= "/")
	public ModelAndView indexpage(HttpSession session){
		System.out.println("Controller");
		ModelAndView mv = new ModelAndView("index");
		List<category> showcat = catsrv.categorynamelist();
		System.out.println("Category size: "+showcat.size());
		
		session.setAttribute("category", showcat);
		return mv;
	}
	
	
	


	@RequestMapping(value="/contactus")
	public String contactus()
	{
		System.out.println("inside contact controller");
		return "contactus";
	}
	
	@RequestMapping(value="/blog")
	public String blog()
	{
		System.out.println("inside blog controller");
		return "blog";
	}
	
	

}
