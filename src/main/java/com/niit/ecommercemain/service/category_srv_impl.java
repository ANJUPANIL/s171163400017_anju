package com.niit.ecommercemain.service;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.category_dao;
import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.category;

@Service
@Transactional
public class category_srv_impl implements category_srv 
{
	@Autowired
	category_dao cd;
	
	
	public void savecategory(category cat) {
		cd.savecategory(cat);
		
	}
	
	public List<category> allcategory() {
		return cd.allcategory();
		
	}
	
	public category getcategoryid(String id) {
		return cd.getcategoryid(id);
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	public void updatecategory(category cat) {
		
		
		cd.updatecategory(cat);
	}
	
	
	public void deletecategory(String id) {
		cd.deletecategory(id);
		
	}

	
	public List<category> getbrandlist(String categoryname) {
		
		return cd.getbrandlist(categoryname);
	}

	@Override
	public List<category> categorynamelist() {
		return cd.categorynamelist();
	}

	@Override
	public List<category> categorylist(String bid) {
		return cd.categorylist(bid);
	}

	

}
