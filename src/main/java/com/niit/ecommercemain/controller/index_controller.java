package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.product_srv;
import com.niit.ecommercemain.service.userdetails_srv;

@Controller
public class index_controller {
	
	@Autowired
	userdetails_srv us;
	
	@Autowired
	category_srv catsrv;
	
	@Autowired
	product_srv ps;
	
	@Autowired
	cart_srv c;
	
	@RequestMapping(value= "/")
	public ModelAndView indexpage(HttpSession session,HttpServletRequest request){
		
		System.out.println("Controller");
		ModelAndView mv = new ModelAndView("index");
		List<category> showcat = catsrv.categorynamelist();
		System.out.println("Category size: "+showcat.size());
		
		session.setAttribute("category", showcat);
		try {
			
			if (request.getUserPrincipal().getName() != null) {
				System.out.println(" login : " +request.getUserPrincipal().getName());
				userdetails u = us.getuserdetailsid(request.getUserPrincipal().getName());
				userlogin ulogin=us.getdetailsbyid(request.getUserPrincipal().getName());
				System.out.println("username: " + ulogin.getUser_id());
				//System.out.println("role : " + u.getRole());
				if (ulogin.getRole().equals("ROLE_ADMIN")) {
					System.out.println("isadmin : " + request.getUserPrincipal().getName());
					mv = new ModelAndView("redirect:adminhome");
					mv.addObject("isadmin","true");
					mv.addObject("isadmin", request.getUserPrincipal().getName());
					mv.addObject("loggedinuser", request.getUserPrincipal().getName());
					session.setAttribute("userid", request.getUserPrincipal().getName());

				} else if (ulogin.getRole().equals("ROLE_USER")) {
					System.out.println("loggedinuser" + request.getUserPrincipal().getName());
					session.setAttribute("welcomemsg",u.getFname());
					List<cart> cartlist = c.getallcart(request.getUserPrincipal().getName());
					mv.addObject("cartsize",cartlist.size());
					mv.addObject("loggedinuser", request.getUserPrincipal().getName());
					session.setAttribute("userid", request.getUserPrincipal().getName());
					mv.addObject("isadmin","false");

				}
			}
		} catch (NullPointerException e) {

		}
		
		return mv;
	}
	
	
	@RequestMapping(value="/about")
	public String about()
	{
		System.out.println("inside contact controller");
		return "about";
	}
	
	@RequestMapping(value="/blog")
	public String blog()
	{
		System.out.println("inside blog controller");
		return "blog";
	}
	
	@RequestMapping(value="/contactus")
	public ModelAndView contactus(HttpSession session)
	{
		System.out.println("contactus");
		String loggedinuser = (String)session.getAttribute("userid");
		ModelAndView mv = new ModelAndView("contactus");
		if (session.getAttribute("userid") != null)
		{
			
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			
		}
		return mv;
		
	}
	

}
