package com.niit.ecommercemain.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;
import com.niit.ecommercemain.service.userdetails_srv;

@Controller
public class userdetails_controller {
	@Autowired
	userdetails_srv us;
	
	
	@Autowired
	ServletContext srv;

	@RequestMapping(value="/registration")
	public ModelAndView register()
	{
		System.out.println("Register loaded");
		return new ModelAndView("registration");
		
	}
	
	@RequestMapping(value = "/login")
	public String userLogin() {
		return "login";
	}
	
	@ModelAttribute("save_userdetails")
	public userdetails createFormModelAttribute() {
		return new userdetails();
	}
	
	@RequestMapping(value = "/saveuserdetails", method = RequestMethod.POST)
	public ModelAndView saveuserdetails(@Valid @ModelAttribute("save_userdetails") userdetails b, Model model,BindingResult result) {
		System.out.println("save controller");
		ModelAndView mv;
		System.out.println("userdetails ID :" + b.getUser_id());
		System.out.println("userdetails Name :" + b.getFname());
		
		if(result.hasErrors())
			{
				mv = new ModelAndView("registration");
			}
			else
			{
			
			us.saveuserdetails(b);
			us.saveuser(b.getUser_id(), b.getPassword());
			mv=new ModelAndView("redirect:login");
			mv.addObject("msg","Registered Successfully......");
			}
			
		return mv;
		
	}
	@RequestMapping(value = "/edituserdetails",method=RequestMethod.GET)
	public ModelAndView updateuserdetails(@RequestParam("id") String id) {
		
		System.out.println("in updateuserdetails id:"+id);
		userdetails olduserdetails = us.getuserdetailsid(id);
		return new ModelAndView("edituserdetails","udata", olduserdetails);
	}
	
	@ModelAttribute("edit_userdetails")
	public userdetails getuserdetails() {
		return new userdetails();
	}

	@RequestMapping(value = "/update_userdetails", method = RequestMethod.POST)
	public ModelAndView edituserdetails(@Valid @ModelAttribute("edit_userdetails") userdetails c) {
		ModelAndView mv;
		us.updateuserdetails(c);
		System.out.println("in edituserdetails id:");
		mv = new ModelAndView("userdetails");
		List<userdetails> showuserdetails = us.alluserdetails();
		mv.addObject("userdetails", showuserdetails);
		return mv;
	}
	
	//Delete Operation
		@RequestMapping(value = "/deluserdetails")
		public String removeCategory(@RequestParam("id") String id){
		us.deleteuserdetails(id);
			return "redirect:/userdetails";
		}
		
		@ModelAttribute("check_login")
		public userlogin getCategoryObject(){
			return new userlogin();
		}
		
	
		@RequestMapping("/loginsubmit")
		public ModelAndView login(@ModelAttribute("check_login") @RequestParam(value="user_id") String userid,
				@RequestParam(value="password") String password,HttpSession session)
		{
			userlogin u;
			userdetails ud=us.getuserdetailsid(userid);
			ModelAndView mv ;//= new ModelAndView("index");
			boolean isvaliduser = us.isvaliduser(userid,password);
			System.out.println("isvaliduser :"+isvaliduser);
			System.out.println("userid"+userid+"password"+password);
			if(isvaliduser == true)
			{
				
				u = us.getdetailsbyid(userid);
				mv = new ModelAndView("index");
				mv.addObject("loggedinuser",u.getUser_id());
				if(u.getRole() == 1)
				{
					System.out.println("its admin");
					mv = new ModelAndView("redirect:adminhome");
					mv.addObject("isadmin","true");
				}
				else{
					mv = new ModelAndView("redirect:userhome");
					mv.addObject("isadmin","false");
					System.out.println("its user"+ ud.getFname());
					session.setAttribute("welcomemsg",ud.getFname());
					session.setAttribute("userid", userid);
				}
			}
			else
			{
				mv = new ModelAndView("login");
				mv.addObject("invalidcredentials","true");
				mv.addObject("errormessage","invalidcredentials");
			}
				return mv;
		}
		
		@RequestMapping("/adminhome")
		public String adminlogin(){
			return "adminhome";
		}
		
		@RequestMapping("/userhome")
		public String userlogin(){
			return "userhome";
		}
		
		@RequestMapping("index")
		public String homeindex(){
			return "index";
		}
		
		@RequestMapping("/logout")
		public ModelAndView logout(HttpServletRequest request,HttpSession session)
		{
			ModelAndView mv = new ModelAndView("/index");
			session.invalidate();
			session = request.getSession(true);
			mv.addObject("loggedout","true");
			return mv;
		}
		
		
}
