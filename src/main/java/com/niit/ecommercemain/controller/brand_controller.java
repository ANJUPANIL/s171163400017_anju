package com.niit.ecommercemain.controller;

import java.util.List;

import javax.validation.Valid;

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
import com.niit.ecommercemain.service.brand_srv;

@Controller
public class brand_controller {
	@Autowired
	brand_srv bs;

	UtilityFunctions obj = new UtilityFunctions();
	
	@RequestMapping(value = "/showbrands")
	@ResponseBody
	public List<brand> getallbrand() {
		System.out.println("show brands controller");
		
		List<brand> lsts = bs.allbrand();
		return lsts;
	}
	
	@RequestMapping(value="/brand")
	public ModelAndView brandhome()
	{
		return new ModelAndView("brand");
	}
	
	@ModelAttribute("save_brand")
	public brand createFormModelAttribute() {
		return new brand();
	}
	
	@RequestMapping(value = "/savebrand", method = RequestMethod.POST)
	public ModelAndView savebrand(@Valid @ModelAttribute("save_brand") brand b, Model model) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("Brand ID :" + b.getBrand_id());
		System.out.println("Brand Name :" + b.getBrand_name());
		mv = new ModelAndView("brand");
		try
		{
			bs.savebrand(b);
			
			List<brand> showall = bs.allbrand();
			mv.addObject("brand", showall);
		}
		catch(Exception ex){
			model.addAttribute("error", ex.getMessage());
		}
		return mv;
		
	}
	@RequestMapping(value = "/editbrand",method=RequestMethod.GET)
	public ModelAndView updatebrand(@RequestParam("id") String id) {
		
		System.out.println("in updatebrand id:"+id);
		brand oldbrand = bs.getbrandid(id);
		return new ModelAndView("editbrand","bdata", oldbrand);
	}
	
	@ModelAttribute("edit_brand")
	public brand getbrand() {
		return new brand();
	}

	@RequestMapping(value = "/update_brand", method = RequestMethod.POST)
	public ModelAndView editbrand(@Valid @ModelAttribute("edit_brand") brand c) {
		ModelAndView mv;
		bs.updatebrand(c);
		System.out.println("in editbrand id:");
		mv = new ModelAndView("brand");
		List<brand> showbrand = bs.allbrand();
		mv.addObject("brand", showbrand);
		return mv;
	}
	
	//Delete Operation
		@RequestMapping(value = "/delbrand")
		public String removeCategory(@RequestParam("id") String id){
		bs.deletebrand(id);
			return "redirect:/brand";
		}
	
}
