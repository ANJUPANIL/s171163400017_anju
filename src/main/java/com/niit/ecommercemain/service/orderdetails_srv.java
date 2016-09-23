package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.orderdetails;

public interface orderdetails_srv {
	
public List<orderdetails> getallorderdetails(String userid);
	
	public void saveorderdetails(orderdetails obj);
	
	public void updateorderdetails(orderdetails orderdetails);
	
	public void deleteorderdetails(String id);
	
}
