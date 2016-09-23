package com.niit.ecommercemain.dao;

import java.util.List;


import com.niit.ecommercemain.model.payment;

public interface payment_dao {
	
	public List<payment> getallpayment(String userid);
	
	public void savepayment(payment obj);
	
	public void updatepayment(payment payment);
	
	public payment getpaymentbyid(String id);
}
