package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.UtilityFunctions;
import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;
import com.niit.ecommercemain.model.supplier;
import com.niit.ecommercemain.service.brand_srv;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.product_srv;
import com.niit.ecommercemain.service.supplier_srv;



@Controller
public class product_controller {
	@Autowired
	product_srv ps;
	
	@Autowired
	category_srv cs;
	
	@Autowired
	brand_srv bs;
	
	@Autowired
	supplier_srv s;
	
	@Autowired
	ServletContext srv;
	
	product oldproduct;
	
	@RequestMapping(value = "/showproducts")
	@ResponseBody
	public List<product> getallproduct() {
		System.out.println("show products controller");
		List<category> showcat = cs.allcategory();
		List<brand> showbrand = bs.allbrand();
		List<supplier> showsupplier = s.allsupplier();
		List<product> lsts = ps.allproduct();
		for(int i=0;i<lsts.size();i++)
		{
			if(lsts.get(i).getCategory_id().equals(showcat.get(i).getId()))
			{
				lsts.get(i).setCategory_id(showcat.get(i).getName());
			}
			if(lsts.get(i).getBrand_id().equals(showbrand.get(i).getId()))
			{
				lsts.get(i).setBrand_id(showbrand.get(i).getName());
			}
			if(lsts.get(i).getSup_id().equals(showsupplier.get(i).getId()))
			{
				lsts.get(i).setSup_id(showsupplier.get(i).getName());
			}
			
		}
		return lsts;
	}
	
	@RequestMapping(value="/product")
	public ModelAndView producthome()
	{

		ModelAndView mv = new ModelAndView("product");
		List<category> showcat = cs.allcategory();
		List<brand> showbrand = bs.allbrand();
		List<supplier> showsupplier = s.allsupplier();
		mv.addObject("category", showcat);
		mv.addObject("brand", showbrand);
		mv.addObject("supplier", showsupplier);
		return mv;
	}
	
	@ModelAttribute("save_product")
	public product createFormModelAttribute() {
		return new product();
	}
	
	@RequestMapping(value = "/saveproduct", method = RequestMethod.POST)
	public ModelAndView saveproduct(@ModelAttribute("save_product") product c, Model model) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("product ID :" + c.getId());
		System.out.println("product Name :" + c.getName());
		System.out.println("product image :" + c.getProduct_image());
		mv = new ModelAndView("product");
		String path = srv.getRealPath("/");
		String res =c.getFilePath(path, srv.getContextPath());
		System.out.println(res);
		
		try
		{
			
			ps.saveproduct(c);
			List<product> showall = ps.allproduct();
			mv.addObject("product", showall);
			mv.addObject("path",res);
			
		}
		catch(Exception ex)
		{
			model.addAttribute("error", ex.getMessage());
		}
		return mv;
		
	}
	
	@RequestMapping(value = "/editproduct",method=RequestMethod.GET)
	public ModelAndView updateproduct(@RequestParam("id") String id) {
		System.out.println("in edit product id:"+id);
		oldproduct= ps.getproductid(id);
		return new ModelAndView("editproduct","pdata", oldproduct);
	}
	
	@ModelAttribute("edit_product")
	public product getproduct() {
		return new product();
		
	}

	@RequestMapping(value = "/update_product", method = RequestMethod.POST)
	public ModelAndView editproduct(@ModelAttribute("edit_product") product c) {
		String pimage=oldproduct.getProduct_image();
		System.out.println("pimage"+pimage);
		
		String path = srv.getRealPath("/");
		String res = c.getFilePath(path, srv.getContextPath());
		if (res == "fail")
		{
			ModelAndView mv;
			c.setProduct_image(pimage);
			ps.updateproduct(c);
			System.out.println("in editproduct id:");
			mv = new ModelAndView("product");
			List<product> showproduct = ps.allproduct();
			mv.addObject("product", showproduct);
			return mv;
			
		
		}
		else {
			ModelAndView mv;
			System.out.println("in updateproduct image:"+c.getProduct_image());
			ps.updateproduct(c);
			System.out.println("in editproduct id:");
			mv = new ModelAndView("product");
			List<product> showproduct = ps.allproduct();
			mv.addObject("product", showproduct);
			return mv;
	
			}
		
	}
	
	//Delete Operation
		@RequestMapping(value = "/delproduct")
		public String removeproduct(@RequestParam("id") String id){
		ps.deleteproduct(id);
			return "redirect:/product";
		}
	
}
