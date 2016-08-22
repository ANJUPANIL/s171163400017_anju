package com.niit.ecommercemain.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.UtilityFunctions;
import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.service.brand_srv;
import com.niit.ecommercemain.service.category_srv;



@Controller
public class category_controller {
	@Autowired
	category_srv cs;

	@Autowired
	brand_srv bs;
	
	@RequestMapping(value = "/showcategorys")
	@ResponseBody
	public List<category> getallcategory() {
		System.out.println("show categorys controller");
		List<brand> showbrand = bs.allbrand();
		
		List<category> lsts = cs.allcategory();
		for(int i=0;i<lsts.size();i++)
		{
			String b=showbrand.get(i).getId();
			if(lsts.get(i).getBrand_id().equals(b))
			{
				String name=showbrand.get(i).getName();
				lsts.get(i).setBrand_id(name);
			}
		}
		return lsts;
	}
	
	@RequestMapping(value="/category")
	public ModelAndView categoryhome()
	{
		
		List<brand> showbrand=bs.allbrand();
		
		return new ModelAndView("category","brand",showbrand);
	}
	
	@ModelAttribute("save_category")
	public category createFormModelAttribute() {
		return new category();
	}
	
	@RequestMapping(value = "/savecategory", method = RequestMethod.POST)
	public ModelAndView savecategory(@ModelAttribute("save_category") category c, Model model) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("category ID :" + c.getId());
		System.out.println("category Name :" + c.getName());
		mv = new ModelAndView("category");
		
		try
		{
			cs.savecategory(c);
			
			List<category> showall = cs.allcategory();
			mv.addObject("category", showall);
		}
		catch(Exception ex){
			model.addAttribute("error", ex.getMessage());
		}
		return mv;
		
	}
	@RequestMapping(value = "/editcategory",method=RequestMethod.GET)
	public ModelAndView updatecategory(@RequestParam("id") String id) {
		
		System.out.println("in updatecategory id:"+id);
		category oldcategory = cs.getcategoryid(id);
		return new ModelAndView("editcategory","cdata", oldcategory);
	}
	
	@ModelAttribute("edit_category")
	public category getcategory() {
		return new category();
		
	}

	@RequestMapping(value = "/update_category", method = RequestMethod.POST)
	public ModelAndView editcategory(@ModelAttribute("edit_category") category c) {
		ModelAndView mv;
		cs.updatecategory(c);
		System.out.println("in editcategory id:");
		mv = new ModelAndView("category");
		List<category> showcategory = cs.allcategory();
		mv.addObject("category", showcategory);
		return mv;
	}
	
	//Delete Operation
		@RequestMapping(value = "/delcategory")
		public String removeCategory(@RequestParam("id") String id){
		cs.deletecategory(id);
			return "redirect:/category";
		}
	
}
