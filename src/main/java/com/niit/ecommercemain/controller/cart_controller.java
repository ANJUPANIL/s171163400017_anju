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
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.product_srv;
import com.niit.ecommercemain.service.userdetails_srv;

@Controller
public class cart_controller {
	@Autowired
	category_srv c;
	
	@Autowired
	cart_srv cs;

	@Autowired
	userdetails_srv us;
	
	@Autowired
	product_srv ps;

	@RequestMapping(value ="/addcart", method = RequestMethod.GET)
	public ModelAndView addcart(@RequestParam(value = "id") String id, HttpServletRequest request){
		System.out.println(id);
		HttpSession session = request.getSession();
		String loggedinuser = (String)session.getAttribute("userid");
		String name=(String)session.getAttribute("name");
		System.out.println(loggedinuser);
		System.out.println(name);
		ModelAndView mv;
		
		
		if (session.getAttribute("userid") == null) {
			System.out.print("inside user null");
			mv = new ModelAndView("login");
			mv.addObject("check_login", new userlogin());
			
		}
		else{
			System.out.println("in else");
			
			
			cart cart= new cart();
			product product= ps.getproductid(id);
			System.out.println("cart obj");
			cart.setProduct(product);
			cart.setQuantity(1);
			cart.setStatus(false);
			userdetails u=us.getuserdetailsid(loggedinuser);
			cart.setUser(u);
			System.out.println("discount:"+(1-((double)product.getDiscount()/100)));
			System.out.println("with quantity:"+(1-((double)product.getDiscount()/100))*(cart.getQuantity()));
			double total = (double)((product.getPrice())*(1-((double)product.getDiscount()/100))*(cart.getQuantity()));
			cart.setTotal(total);
			System.out.println("total");
			System.out.println(cart.getTotal());
			System.out.println(cart.getUser());
			
			
			cs.savecart(cart);
			mv = new ModelAndView("shopproduct");
			List<product> allcatproduct = ps.getcategorylist(name);
			System.out.println("Size  "+allcatproduct.size());
			List<category> showbrand=c.getbrandlist(name);
			mv.addObject("brand",showbrand);
			mv.addObject("product", allcatproduct);
			session.setAttribute("name", name);
			
			List<cart> cartlist = cs.getallcart(loggedinuser);
			mv.addObject("cartlist",cartlist);
			mv.addObject("cartsize",cartlist.size());
			
				}	
			return mv;
			
		}
	
	
	
	
}
