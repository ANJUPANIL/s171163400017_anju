
package com.niit.ecommercemain.dao;

import java.util.List;

import com.niit.ecommercemain.model.orderdetails;


public interface orderdetails_dao 
{
	public List<orderdetails> getallorderdetails(String userid);
	
	public void saveorderdetails(orderdetails obj);
	
	public void updateorderdetails(orderdetails orderdetails);
	
	public void deleteorderdetails(String id);
	
	
	
}
