package com.niit.ecommercemain.service;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.brand_dao;
import com.niit.ecommercemain.model.brand;

@Service
@Transactional
public class brand_srv_impl implements brand_srv 
{
	@Autowired
	brand_dao cd;
	
	@Override
	public void savebrand(brand brand) {
		
		cd.savebrand(brand);
		System.out.println(brand.getId());
		
	}
	@Override
	public List<brand> allbrand() {
		return cd.allbrand();
		
	}
	
	@Override
	public brand getbrandid(String id) {
		return cd.getbrandid(id);
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	@Override
	public void updatebrand(brand brand) {
		
		cd.updatebrand(brand);
	}
	
	@Override
	public void deletebrand(String id) {
		cd.deletebrand(id);
		
	}

}
