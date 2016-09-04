package com.niit.ecommercemain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.cart_dao;
import com.niit.ecommercemain.model.cart;

@Service
@Transactional
public class cart_srv_impl implements cart_srv 
{
	@Autowired
	cart_dao cd;
	
	public List<cart> getallcart(String username) {
		return cd.getallcart(username);
	}

	public void savecart(cart obj) {
		cd.savecart(obj);

	}

	public void updatecart(cart cart) {
		cd.updatecart(cart);

	}

	public void deletecart(String id) {
		cd.deletecart(id);

	}

	public double gettotalamount(String user_name) {
		return cd.gettotalamount(user_name);
	}

	public void updatebyid(String id) {
		cd.updatebyid(id);
		
	}
	
}
