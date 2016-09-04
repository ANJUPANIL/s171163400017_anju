package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.cart;

public interface cart_srv {
	
	public List<cart> getallcart(String userid);
	
	public void savecart(cart obj);
	
	public void updatecart(cart cart);
	
	public void deletecart(String id);
	
	public double gettotalamount(String userid);
	
	public void updatebyid(String id);

}
