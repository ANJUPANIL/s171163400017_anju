
package com.niit.ecommercemain.dao;

import java.util.List;

import com.niit.ecommercemain.model.cart;
import com.niit.ecommercemain.model.category;

public interface cart_dao 
{
	public List<cart> getallcart(String userid);
	
	public void savecart(cart obj);
	
	public void updatecart(cart cart);
	
	public void deletecart(String id);
	
	public double gettotalamount(String userid);
	
	public void updatebyid(String id);
	
	public void updatecartstatus(String id);
	
	
}
