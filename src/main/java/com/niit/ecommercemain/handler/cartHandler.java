package com.niit.ecommercemain.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.orderdetails;
import com.niit.ecommercemain.model.payment;
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.service.cart_srv;
import com.niit.ecommercemain.service.orderdetails_srv;
import com.niit.ecommercemain.service.payment_srv;
import com.niit.ecommercemain.service.userdetails_srv;

@Component
public class cartHandler {
	@Autowired
	orderdetails_srv ordersrv;
	
	@Autowired
	userdetails_srv usrsrv;
	
	@Autowired
	cart_srv cartsrv;
	
	@Autowired
	payment_srv paysrv;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	payment pay;
	
	public orderdetails initflow(){
		orderdetails details = new orderdetails();
		
		session= request.getSession();
		
		String loggedinuser = (String)session.getAttribute("userid");
		System.out.println("cart handler " + loggedinuser);
		userdetails user=usrsrv.getuserdetailsid(loggedinuser);
		details.setUser(user);
		pay.setUser_id(loggedinuser);
		List<cart> cartlist = cartsrv.getallcart(loggedinuser);
		
		session.setAttribute("cartlist",cartlist);
		session.setAttribute("cartsize",cartlist.size());
		return details;
	}
	
	

	public String validateDetails(orderdetails details,payment pay,MessageContext messageContext){
		String status = "success";
		
		
		if(details.getBilling_address().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"billing_address").defaultText("Billing address cannot be Empty!!").build());
			status = "failure";
		}
		if(details.getShipping_address().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"shipping_address").defaultText("shipping address cannot be Empty!!").build());
			status = "failure";
		}
		
		this.pay.setCardNumber(request.getParameter("cardnumber"));
		
		System.out.println("Carnumber"+this.pay.getCardNumber());
		if(this.pay.getCardNumber().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"cardnumber").defaultText("Card number cannot be Empty!!").build());
			status = "failure";
		}
		this.pay.setCvNumber(request.getParameter("car_code"));
		if(this.pay.getCvNumber().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"car_code").defaultText("Card CVV cannot be Empty!!").build());
			status = "failure";
		}
		this.pay.setCardtype(request.getParameter("CreditCardType"));
		if(this.pay.getCardtype().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"CreditCardType").defaultText("Select any credit card type!!").build());
			status = "failure";
		}
		this.pay.setNameOnCard(request.getParameter("car_name"));
		if(this.pay.getNameOnCard().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"car_name").defaultText("Name on card cannot be Empty!!").build());
			status = "failure";
		}
		this.pay.setExpiryMonth(request.getParameter("expmonth"));
		if(this.pay.getExpiryMonth().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"expmonth").defaultText("Select card expiry month!!").build());
			status = "failure";
		}
		this.pay.setExpiryYear(request.getParameter("expyear"));
		if(this.pay.getExpiryYear().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"expyear").defaultText("Select card expiry year!!").build());
			status = "failure";
		}
		
		
		
		return status;
	}
	public String savedetails(orderdetails details,payment pay,MessageContext messageContext)
	{
		System.out.println("Save order in handler");
		List<cart> c=(List<cart>) session.getAttribute("cartlist");
		System.out.println(c.size());
		
		for(int i=0;i<c.size();i++)
		{
		details.setOrder_date(request.getParameter("order_date"));
		details.setGrandtotal((double)session.getAttribute("grandtotal"));
		details.setCartobj(c.get(i));
		ordersrv.saveorderdetails(details);
		String id=details.getCartobj().getId();
		System.out.println("card handler update status : " +id);
		cartsrv.updatecartstatus(id);
		
		}
		this.pay.setCardNumber(request.getParameter("cardnumber"));
		
		this.pay.setCvNumber(request.getParameter("car_code"));
		this.pay.setCardtype(request.getParameter("CreditCardType"));
		this.pay.setTotalCost((double)session.getAttribute("grandtotal"));
		this.pay.setUser_id((String)session.getAttribute("userid"));
		this.pay.setNameOnCard(request.getParameter("car_name"));
		this.pay.setExpiryMonth(request.getParameter("expmonth"));
		this.pay.setExpiryYear(request.getParameter("expyear"));
		this.pay.setOrder_no(details.getOrder_no());
		paysrv.savepayment(this.pay);
		
		return "success";
	}
	
	
	public String setdetails(orderdetails details)
	{
		String b=request.getParameter("billing_address");
		System.out.println("Baddres  " + b);
		String s=request.getParameter("shipping_address");
		System.out.println("Saddres  " + b);
		details.setBilling_address(b);
		details.setShipping_address(s);
		
		
		
		return "success";
	}
	



}

