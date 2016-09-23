package com.niit.ecommercemain.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.payment_dao;
import com.niit.ecommercemain.model.payment;

@Service
@Transactional
public class payment_srv_impl implements payment_srv 
{
	@Autowired
	payment_dao cd;
	
	@Override
	public void savepayment(payment payment) {
		
		cd.savepayment(payment);	
	}

	@Override
	public void updatepayment(payment payment) {
		
		cd.updatepayment(payment);
	}
	@Override
	public List<payment> getallpayment(String userid) {
		return cd.getallpayment(userid);
	}
	@Override
	public payment getpaymentbyid(String userid) {
		
		return cd.getpaymentbyid(userid);
	}
	
	

}
