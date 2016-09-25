package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.orderdetails;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.orderdetails_srv;

@Controller
public class order_controller {
	
	@Autowired
	orderdetails_srv order;
	
	@Autowired
	cart_srv cart;
	
	@RequestMapping(value = "/vieworders")
	public ModelAndView myorders(HttpServletRequest request){
		HttpSession session= request.getSession();
		
		ModelAndView mv = new ModelAndView("vieworders");
		mv.addObject("orderdetails", new orderdetails());
		System.out.println("In add cart controller");
		String loggedinuser = (String)session.getAttribute("userid");
		List<orderdetails>orderlist=order.getallorderdetails(loggedinuser);
		mv.addObject("orderlist",orderlist);
		
		List<cart> cartlist = cart.getallcart(loggedinuser);
		mv.addObject("cartsize",cartlist.size());
		return mv;
	}

}
