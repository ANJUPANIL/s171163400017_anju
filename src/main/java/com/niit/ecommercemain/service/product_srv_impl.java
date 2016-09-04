package com.niit.ecommercemain.service;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.product_dao;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;

@Service
@Transactional
public class product_srv_impl implements product_srv 
{
	@Autowired
	product_dao pd;
	
	
	public void saveproduct(product cat) {
		pd.saveproduct(cat);
		
	}
	
	public List<product> allproduct() {
		return pd.allproduct();
		
	}
	
	public product getproductid(String id) {
		return pd.getproductid(id);
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	public void updateproduct(product cat) {
		
		pd.updateproduct(cat);
	}
	
	
	public void deleteproduct(String id) {
		pd.deleteproduct(id);
		
	}

	@Override
	public List<product> getcategorylist(String categoryname) {
		return pd.getcategorylist(categoryname);
	}

	@Override
	public List<product> getbrandlist(String categoryname, String brandname) {
		
		return pd.getbrandlist(categoryname,brandname);
	}

}
