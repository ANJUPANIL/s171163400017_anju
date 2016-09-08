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
		
		List<category> showcat = cs.categorynamelist();
		System.out.println("Category size: "+showcat.size());
		mv.addObject("category", showcat);
		
		List<cart> cartlist = c.getallcart(loggedinuser);
		mv.addObject("cartsize",cartlist.size());
		return mv;
	
	}
	
	@RequestMapping(value = "/shopbrandproduct", method=RequestMethod.GET)
	public ModelAndView showbrandproduct(HttpServletRequest request,HttpSession session){
		
		String loggedinuser = (String)session.getAttribute("userid");
		String cname=request.getParameter("name");
		String bname=request.getParameter("bname");
		System.out.println("bname : "+bname);
		System.out.println("Show product " +cname+"  "+bname);
		ModelAndView mv = new ModelAndView("shopproduct");
		List<product> allcatproduct = ps.getbrandlist(cname,bname);
		List<category> showbrand=cs.getbrandlist(cname);
		mv.addObject("brand",showbrand);
		mv.addObject("product", allcatproduct);
		
		
		List<cart> cartlist = c.getallcart(loggedinuser);
		mv.addObject("cartsize",cartlist.size());
		return mv;
	
	}
	
	@RequestMapping(value = "/quicklook")
	public ModelAndView quicklook(@RequestParam(value = "pid") String pid)
	{
		ModelAndView mv = new ModelAndView("quicklook");
		product product= ps.getproductid(pid);
		mv.addObject("product", product);
		return mv;
	}
	
	@RequestMapping(value= "/productgallery",method=RequestMethod.GET)
	public ModelAndView products(@RequestParam("name") String name,HttpSession session){
		System.out.println("Controller");
		ModelAndView mv = new ModelAndView("productgallery");
		
		List<product> allcatproduct = ps.getcategorylist(name);
		System.out.println("Size  "+allcatproduct.size());
		List<category> showbrand=cs.getbrandlist(name);
		mv.addObject("brand",showbrand);
		mv.addObject("product", allcatproduct);
		session.setAttribute("name", name);
		return mv;
	}
	
	@RequestMapping(value = "/brandgallery", method=RequestMethod.GET)
	public ModelAndView brandgalery(HttpServletRequest request,HttpSession session){
		
		String cname=request.getParameter("name");
		String bname=request.getParameter("bname");
		System.out.println("bname : "+bname);
		System.out.println("Show product " +cname+"  "+bname);
		ModelAndView mv = new ModelAndView("productgallery");
		List<product> allcatproduct = ps.getbrandlist(cname,bname);
		List<category> showbrand=cs.getbrandlist(cname);
		mv.addObject("brand",showbrand);
		mv.addObject("product", allcatproduct);
	    return mv;
	
	}
	
}
