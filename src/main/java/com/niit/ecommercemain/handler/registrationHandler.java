package com.niit.ecommercemain.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.service.userdetails_srv;

@Component
public class registrationHandler {
	
	@Autowired
	userdetails_srv usersrv;
	
		public userdetails initFlow(){
			return new userdetails();
		}

		public String validateDetails(userdetails userdetails,MessageContext messageContext){
			String status = "success";
			if(userdetails.getUser_id().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"user_id").defaultText("UserId cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getFname().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"fname").defaultText("Name cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getSname().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"sname").defaultText("Name cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getLname().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"lname").defaultText("Name cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getDob().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"dob").defaultText("Name cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getPassword().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"password").defaultText("Password cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getCity().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"city").defaultText("Name cannot be Empty").build());
				status = "failure";
			}
			
			if(userdetails.getContact().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"contact").defaultText("Mobile cannot be Empty").build());
				status = "failure";
			}
			if(userdetails.getAddress().isEmpty()){
				messageContext.addMessage(new MessageBuilder().error().source(
						"address").defaultText("Address cannot be Empty").build());
				status = "failure";
			}
			
			return status;
		}

		public String savedetails(userdetails userdetails,MessageContext messageContext)
		{
			int flag=0;
			String status = "success";
			List<userdetails> allusers=usersrv.alluserdetails();
			for(int i=0;i<allusers.size();i++)
			{
				if(userdetails.getUser_id().equals(allusers.get(i).getUser_id()))
					{
						flag=1;
					}
			}
			if(flag==1)
			{
				
				messageContext.addMessage(new MessageBuilder().error().source(
						"msg").defaultText("User exist with this id......").build());
				status = "failure";
			}
			else
			{
				usersrv.saveuserdetails(userdetails);
				usersrv.saveuser(userdetails.getUser_id(), userdetails.getPassword());
				
				status = "success";
				
				
			}
			
			return status;
		}

}
