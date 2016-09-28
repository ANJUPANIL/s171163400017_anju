package com.niit.ecommercemain.controller;

import java.util.List;

import javax.validation.Valid;

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
		
		List<category> lsts = cs.allcategory();
		
		return lsts;
	}
	
	@RequestMapping(value="/category")
	public ModelAndView categoryhome()
	{
		ModelAndView mv = new ModelAndView("category");
		List<brand> showbrand=bs.allbrand();
		mv.addObject("brand",showbrand);
		
		return mv;
	}
	
	@ModelAttribute("save_category")
	public category createFormModelAttribute() {
		return new category();
	}
	
	@RequestMapping(value = "/savecategory", method = RequestMethod.POST)
	public ModelAndView savecategory(@Valid @ModelAttribute("save_category") category c,BindingResult result, Model model) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("category ID :" + c.getId());
		System.out.println("category Name :" + c.getName());
		mv = new ModelAndView("category");
		List<brand> showbrand=bs.allbrand();
		mv.addObject("brand",showbrand);
		try
		{
			if (result.hasErrors())
			{
				
				return mv;
			}else
			{
		
			cs.savecategory(c);
			
			List<category> showall = cs.allcategory();
			mv.addObject("category", showall);
			
			mv.addObject("save_category",new category());
			return mv;
			}
		}
		catch(Exception ex){
			model.addAttribute("error", ex.getMessage());
			return mv;
		}
		
		
	}
	@RequestMapping(value = "/editcategory",method=RequestMethod.GET)
	public ModelAndView updatecategory(@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView("editcategory");
		System.out.println("in updatecategory id:"+id);
		category oldcategory = cs.getcategoryid(id);
		List<brand> showbrand = bs.allbrand();
		mv.addObject("brand", showbrand);
		mv.addObject("cdata", oldcategory);
		
		return mv;
		
	}
	
	@ModelAttribute("edit_category")
	public category getcategory() {
		return new category();
		
	}

	@RequestMapping(value = "/update_category", method = RequestMethod.POST)
	public ModelAndView editcategory(@Valid @ModelAttribute("edit_category") category c,BindingResult result, Model model) {
		ModelAndView mv = new ModelAndView("category");
		List<brand> showbrand=bs.allbrand();
		mv.addObject("brand",showbrand);
		try{
		if (result.hasErrors())
		{
			
			return mv;
		}else
		{
			cs.updatecategory(c);
			System.out.println("in editcategory id:");
		
			List<category> showcategory = cs.allcategory();
			mv.addObject("category", showcategory);
		
		
		return mv;
		}
		
	}
	catch(Exception ex){
		model.addAttribute("error", ex.getMessage());
		return mv;
	}
	}
	
	//Delete Operation
		@RequestMapping(value = "/delcategory")
		public String removeCategory(@RequestParam("id") String id){
		cs.deletecategory(id);
			return "redirect:/category";
		}
	
}
