package com.niit.ecommercemain.service;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.supplier_dao;
import com.niit.ecommercemain.model.supplier;

@Service
@Transactional
public class supplier_srv_impl implements supplier_srv 
{
	@Autowired
	supplier_dao cd;
	
	
	public void savesupplier(supplier cat) {
		cd.savesupplier(cat);
		
	}
	
	public List<supplier> allsupplier() {
		return cd.allsupplier();
		
	}
	
	public supplier getsupplierid(String id) {
		return cd.getsupplierid(id);
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	public void updatesupplier(supplier cat) {
		
		cd.updatesupplier(cat);
	}
	
	
	public void deletesupplier(String id) {
		cd.deletesupplier(id);
		
	}

}
