package com.niit.ecommercemain.handler;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.ecommercemain.model.userdetails;

@Component
public class registrationHandler {
	
	
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

	

}
