package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.supplier;



@Repository
public class supplier_dao_impl implements supplier_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void savesupplier(supplier s) {
		
		sessionFactory.getCurrentSession().save(s);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<supplier> allsupplier() {
		return (List<supplier>)sessionFactory.getCurrentSession().createQuery("from supplier").list();
	}
	@Override
	public supplier getsupplierid(String id) {
		return (supplier) sessionFactory.getCurrentSession().get(supplier.class, new String(id));
	
	}
	@Override
	public void updatesupplier(supplier s) {
		sessionFactory.getCurrentSession().update(s);
		
	}
	@Override
	public void deletesupplier(String id) {
		sessionFactory.getCurrentSession().createQuery("delete from supplier where sup_id = '"+id+"'").executeUpdate();
	}



}
