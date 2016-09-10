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
import com.niit.ecommercemain.model.userlogin;
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
	public ModelAndView quicklook(@RequestParam(value = "pid") String pid,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String loggedinuser = (String)session.getAttribute("userid");
		
		
		ModelAndView mv = new ModelAndView("quicklook");
		if (session.getAttribute("userid") == null)
		{
			
				product product= ps.getproductid(pid);
				mv.addObject("product", product);
			
		}
		else{
			product product= ps.getproductid(pid);
			mv.addObject("product", product);
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			
		}
		
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
		session.setAttribute("quick", "gallery");
		//mv.addObject("name", name);
		session.setAttribute("name", name);
		return mv;
	}
	
	@RequestMapping(value= "/producttype",method=RequestMethod.GET)
	public ModelAndView producttype(@RequestParam("type") String type,HttpSession session){
		System.out.println("Controller");
		ModelAndView mv = new ModelAndView("producttype");
		
		List<product> allproduct = ps.getproductbytype(type);
		System.out.println("Size  "+allproduct.size());
		
		mv.addObject("product", allproduct);
		session.setAttribute("quick", "type");
		//mv.addObject("type", type);
		session.setAttribute("type",type);
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
	
	@RequestMapping(value = "/searchproduct",method=RequestMethod.POST)
	public ModelAndView searchproduct(@RequestParam("pname") String pname,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loggedinuser = (String)session.getAttribute("userid");
		
		
		ModelAndView mv = new ModelAndView("searchproduct");
		if (session.getAttribute("userid") == null)
		{
			
				List<product> product= ps.productbyname(pname);
				
				mv.addObject("product", product);
				
			
		}
		else{
			List<product> product= ps.productbyname(pname);
			if(product!= null)
			{
			mv.addObject("product", product);
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			}
			else{
				mv.addObject("emptymsg","No products were found matching your selection.");
			}
			
		}
		return mv;
	}
	
}
