package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.product_srv;

@Controller

public class shopproduct_controller {
	@Autowired
	product_srv ps;
	
	@Autowired
	category_srv cs;
	
	@Autowired
	cart_srv c;

	@RequestMapping(value = "/shopproduct", method=RequestMethod.GET)
	public ModelAndView showproduct(@RequestParam("name") String name,HttpSession session){
		
		String loggedinuser = (String)session.getAttribute("userid");
		System.out.println("Show product " +name);
		ModelAndView mv = new ModelAndView("shopproduct");
		List<product> allcatproduct = ps.getcategorylist(name);
		System.out.println("Size  "+allcatproduct.size());
		List<category> showbrand=cs.getbrandlist(name);
		mv.addObject("brand",showbrand);
		mv.addObject("product", allcatproduct);
		session.setAttribute("name", name);
		
		List<cart> cartlist = c.getallcart(loggedinuser);
		mv.addObject("cartsize",cartlist.size());
		return mv;
	
	}
	
	@RequestMapping(value = "/shopbrandproduct", method=RequestMethod.GET)
	public ModelAndView showbrandproduct(HttpServletRequest request){
		
		String cname=request.getParameter("name");
		String bname=request.getParameter("bname");
		System.out.println("bname : "+bname);
		System.out.println("Show product " +cname+"  "+bname);
		ModelAndView mv = new ModelAndView("shopproduct");
		List<product> allcatproduct = ps.getbrandlist(cname,bname);
		List<category> showbrand=cs.getbrandlist(cname);
		mv.addObject("brand",showbrand);
		mv.addObject("product", allcatproduct);
		
		return mv;
	
	}
	
	@RequestMapping(value = "/mycart")
	public ModelAndView addcart(){
		System.out.println(" My cart");
		ModelAndView mv = new ModelAndView("mycart");
		
		return mv;
	
	}
	
}
