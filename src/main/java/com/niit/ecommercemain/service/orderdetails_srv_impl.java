package com.niit.ecommercemain.service;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.orderdetails_dao;
import com.niit.ecommercemain.model.orderdetails;

@Service
@Transactional
public class orderdetails_srv_impl implements orderdetails_srv 
{
	@Autowired
	orderdetails_dao cd;
	
	@Override
	public void saveorderdetails(orderdetails orderdetails) {
		
		cd.saveorderdetails(orderdetails);
		
		
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	
	@Override
	public void updateorderdetails(orderdetails orderdetails) {
		
		cd.updateorderdetails(orderdetails);
	}
	
	@Override
	public void deleteorderdetails(String id) {
		cd.deleteorderdetails(id);
		
	}
	@Override
	public List<orderdetails> getallorderdetails(String userid) {
		return cd.getallorderdetails(userid);
	}

}
