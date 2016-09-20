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

import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.category_srv;
import com.niit.ecommercemain.service.userdetails_srv;

@Controller
public class userdetails_controller {
	@Autowired
	userdetails_srv us;
	
	@Autowired
	cart_srv c;
	
	@Autowired
	category_srv catsrv;
	
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
				return mv;
			}
			else
			{ 
				int flag=0;
				List<userdetails> allusers=us.alluserdetails();
				for(int i=0;i<allusers.size();i++)
				{
					if(b.getUser_id().equals(allusers.get(i).getUser_id()))
						{
							flag=1;
						}
				}
				if(flag==1)
				{
					mv = new ModelAndView("registration");
					mv.addObject("msg","User exist with this id......");
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
					mv = new ModelAndView("redirect:index");
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
		
		@RequestMapping(value="/userhome")
		public ModelAndView userhome(HttpSession session)
		{
			System.out.println("userhome");
			String loggedinuser = (String)session.getAttribute("userid");
			ModelAndView mv = new ModelAndView("userhome");
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			return mv;
			
		}
		
		@RequestMapping("index")
		public ModelAndView homeindex(HttpSession session){
			String loggedinuser = (String)session.getAttribute("userid");
			ModelAndView mv = new ModelAndView("index");
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			return mv;
		}
		
		@RequestMapping("/logout")
		public ModelAndView logout(HttpServletRequest request,HttpSession session)
		{
			ModelAndView mv = new ModelAndView("/index");
			session.invalidate();
			session = request.getSession(true);
			mv.addObject("loggedout","true");
			List<category> showcat = catsrv.categorynamelist();
			System.out.println("Category size: "+showcat.size());
			
			session.setAttribute("category", showcat);
			return mv;
		}
		
		@RequestMapping(value="/userprofile")
		public ModelAndView userprofile(HttpSession session)
		{
			System.out.println("profile");
			String loggedinuser = (String)session.getAttribute("userid");
			ModelAndView mv = new ModelAndView("userprofile");
			userdetails user=us.getuserdetailsid(loggedinuser);
			mv.addObject("userdetails",user);
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			return mv;
			
		}
		
		@RequestMapping(value="/userprofileedit")
		public ModelAndView usereditprofile(HttpSession session,@RequestParam(value="click") String click)
		{
			System.out.println("profile");
			String loggedinuser = (String)session.getAttribute("userid");
			ModelAndView mv = new ModelAndView("userprofileedit");
			userdetails user=us.getuserdetailsid(loggedinuser);
			mv.addObject("userdetails",user);
			List<cart> cartlist = c.getallcart(loggedinuser);
			mv.addObject("cartsize",cartlist.size());
			
			session.setAttribute("click",click);
			
			return mv;
			
		}
		

		@ModelAttribute("edit_profile")
		public userdetails getuser() {
			System.out.println("Edit profile attribute");
			return new userdetails();
		}

		@RequestMapping(value = "/update_profile", method = RequestMethod.POST)
		public ModelAndView editprofile(HttpServletRequest request,@Valid @ModelAttribute("edit_profile") userdetails u, Model model) {
			System.out.println("in editprofile");
			
			ModelAndView mv;
			HttpSession session=request.getSession();
			String loggedinuser = (String)session.getAttribute("userid");
			String click = (String)session.getAttribute("click");
			String password=request.getParameter("newpassword");

			System.out.println("in editprofile click" + click);
			System.out.println("in editprofile pass" + password);
			//userlogin userlogin=new userlogin();
			
			userdetails old=us.getuserdetailsid(loggedinuser);
			mv = new ModelAndView("userprofile");
			if(click.equals("profile"))
			{
				u.setUser_id(loggedinuser);
				u.setPassword(old.getPassword());
				
				us.updateuserdetails(u);
				
				userdetails user=us.getuserdetailsid(loggedinuser);
				mv.addObject("userdetails",user);
				List<cart> cartlist = c.getallcart(loggedinuser);
				mv.addObject("cartsize",cartlist.size());
			}
			else if(click.equals("password")){
				System.out.println("inside else password");
				us.updatepassword(loggedinuser, password);
				
				userdetails user=us.getuserdetailsid(loggedinuser);
				mv.addObject("userdetails",user);
				List<cart> cartlist = c.getallcart(loggedinuser);
				mv.addObject("cartsize",cartlist.size());
				
			}
			
			return mv;
		}
		
		
}
