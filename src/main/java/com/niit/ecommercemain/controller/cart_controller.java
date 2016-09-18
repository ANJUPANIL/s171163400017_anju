package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			int flag=0;
			System.out.println("in else");
			List<cart> cartcontent=cs.getallcart(loggedinuser);
			mv = new ModelAndView("shopproduct");
			for(int i=0;i<cartcontent.size();i++)
			{
				if(cartcontent.get(i).getProduct().getId().equals(id))
				{
					flag=1;
				}
			}
			if(flag==1)
			{
				mv.addObject("msg","Already added to cart");
				List<product> allcatproduct = ps.getcategorylist(name);
				System.out.println("Size  "+allcatproduct.size());
				List<category> showcat=c.getbrandlist(name);
				mv.addObject("brand",showcat);
				mv.addObject("product", allcatproduct);
				session.setAttribute("name", name);
				
				List<cart> cartlist = cs.getallcart(loggedinuser);
				mv.addObject("cartlist",cartlist);
				mv.addObject("cartsize",cartlist.size());
			}
			else
			{
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
			
			List<product> allcatproduct = ps.getcategorylist(name);
			System.out.println("Size  "+allcatproduct.size());
			List<category> showcat=c.getbrandlist(name);
			mv.addObject("brand",showcat);
			mv.addObject("product", allcatproduct);
			session.setAttribute("name", name);
			
			List<cart> cartlist = cs.getallcart(loggedinuser);
			mv.addObject("cartlist",cartlist);
			mv.addObject("cartsize",cartlist.size());
			
			
				}
			
		}
			return mv;
			
		}
	@RequestMapping(value = "/mycart", method = RequestMethod.GET)
	public ModelAndView mycart(HttpServletRequest request){
		HttpSession session= request.getSession();
		double grandtotal=0;
		ModelAndView mv = new ModelAndView("mycart");
		mv.addObject("cart", new cart());
		System.out.println("In add cart controller");
		String loggedinuser = (String)session.getAttribute("userid");
		List<cart> cartlist = cs.getallcart(loggedinuser);
		if(cartlist.size()==0)
		{
			System.out.println("cart controller");
			mv.addObject("emptymsg", "No products were found matching your selection.");
		}
		else{

		System.out.println("cart controller");
		mv.addObject("cartlist",cartlist);
		
		mv.addObject("totalamount",cs.gettotalamount(loggedinuser));
		mv.addObject("displaycart","true");
		for(int i = 0;i<=cartlist.size()-1;i++)
		{
			grandtotal = grandtotal+cartlist.get(i).getTotal();
			System.out.println(grandtotal);
		}
		mv.addObject("grandtotal", grandtotal);
		System.out.println("hello");
		System.out.println(grandtotal);
		session.setAttribute("grandtotal",grandtotal);
		
		
		mv.addObject("cartsize",cartlist.size());
		}
		return mv;
		
	}
	
	
	@RequestMapping(value = "/delcart")
	public String removecart(@RequestParam("id") String id){
		System.out.println("in deletecat id:" + id);	
		cs.deletecart(id);
		return "redirect:/mycart";
	}
	
	@RequestMapping(value="/updatecart",method=RequestMethod.GET)
	public ModelAndView updatecart(HttpServletRequest request)
	{
		System.out.println("Inside update cart");
		String id=request.getParameter("id");
		String pid=request.getParameter("pid");
		String quantity=request.getParameter("quantity");
		
		System.out.println("QTy " + quantity);
		int q=Integer.valueOf(quantity);
		
		double grandtotal=0;
		
		HttpSession session = request.getSession();
		String loggedinuser = (String)session.getAttribute("userid");
		
		ModelAndView mv = new ModelAndView("mycart");
		mv.addObject("cart", new cart());
		
		cart cart= new cart();
		product product= ps.getproductid(pid);
		System.out.println("Product name:" +product.getName());
		System.out.println("cart obj");
		cart.setProduct(product);
		cart.setQuantity(q);
		System.out.println("QTy  after conversion" + cart.getQuantity());
		cart.setStatus(false);
		userdetails u=us.getuserdetailsid(loggedinuser);
		cart.setUser(u);
		System.out.println("discount:"+(1-((double)product.getDiscount()/100)));
		System.out.println("with quantity:"+(1-((double)product.getDiscount()/100))*(cart.getQuantity()));
		double total = (double)((product.getPrice())*(1-((double)product.getDiscount()/100))*(cart.getQuantity()));
		cart.setTotal(total);
		System.out.println("total");
		System.out.println(cart.getTotal());
		System.out.println(cart.getUser().getUser_id());
		
		cs.updatecart(cart);
		System.out.println("Quantity" +cart.getQuantity());
		List<cart> cartlist = cs.getallcart(loggedinuser);
		mv.addObject("cartlist",cartlist);
		mv.addObject("totalamount",cs.gettotalamount(loggedinuser));
		mv.addObject("displaycart","true");
		for(int i = 0;i<=cartlist.size()-1;i++)
		{
			grandtotal = grandtotal+cartlist.get(i).getTotal();
			System.out.println(grandtotal);
		}
		mv.addObject("grandtotal", grandtotal);
		
		System.out.println(grandtotal);
		mv.addObject("cartsize",cartlist.size());
		session.setAttribute("grandtotal",grandtotal);
		
		return mv;
	}
	
	
	
	
}
