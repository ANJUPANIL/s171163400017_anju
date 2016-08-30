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

import com.niit.ecommercemain.model.supplier;
import com.niit.ecommercemain.service.supplier_srv;

@Controller
public class supplier_controller {
	@Autowired
    supplier_srv sup;
	
	@RequestMapping(value = "/showsuppliers")
	@ResponseBody
	public List<supplier> getallsupplier() {
		System.out.println("show suppliers controller");
		
		List<supplier> lsts = sup.allsupplier();
		return lsts;
	}
	
	@RequestMapping(value="/supplier")
	public ModelAndView supplierhome()
	{
		String message="supplier Home";
		return new ModelAndView("supplier","message",message);
	}
	
	@ModelAttribute("save_supplier")
	public supplier createFormModelAttribute() {
		return new supplier();
	}
	
	@RequestMapping(value = "/savesupplier", method = RequestMethod.POST)
	public ModelAndView savesupplier(@Valid @ModelAttribute("save_supplier") supplier s, Model model) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("supplier ID :" + s.getId());
		System.out.println("supplier Name :" + s.getName());
		mv = new ModelAndView("supplier");
		
		try
		{
			sup.savesupplier(s);
			List<supplier> showall = sup.allsupplier();
			mv.addObject("supplier", showall);
		}
		catch(Exception ex){
			model.addAttribute("error", ex.getMessage());
		}
		return mv;
		
	}
	@RequestMapping(value = "/editsupplier",method=RequestMethod.GET)
	public ModelAndView updatesupplier(@RequestParam("id") String id) {
		
		System.out.println("in updatesupplier id:"+id);
		supplier oldsupplier = sup.getsupplierid(id);
		return new ModelAndView("editsupplier","sdata", oldsupplier);
	}
	
	@ModelAttribute("edit_supplier")
	public supplier getsupplier() {
		return new supplier();
		
	}

	@RequestMapping(value = "/update_supplier", method = RequestMethod.POST)
	public ModelAndView editsupplier(@Valid @ModelAttribute("edit_supplier") supplier c) {
		ModelAndView mv;
		sup.updatesupplier(c);
		System.out.println("in editsupplier id:");
		mv = new ModelAndView("supplier");
		List<supplier> showsupplier = sup.allsupplier();
		mv.addObject("supplier", showsupplier);
		return mv;
	}
	
	//Delete Operation
		@RequestMapping(value = "/delsupplier")
		public String removesupplier(@RequestParam("id") String id){
		sup.deletesupplier(id);
			return "redirect:/supplier";
		}
	
		
		

}
