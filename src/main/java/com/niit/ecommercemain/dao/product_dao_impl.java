package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.product;

@Repository
public class product_dao_impl implements product_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void saveproduct(product p) {
		
		sessionFactory.getCurrentSession().save(p);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<product> allproduct() {
		return (List<product>)sessionFactory.getCurrentSession().createQuery("from product").list();
	}
	@Override
	public product getproductid(String id) {
		return (product) sessionFactory.getCurrentSession().get(product.class, new String(id));
	
	}
	@Override
	public void updateproduct(product p) {
		sessionFactory.getCurrentSession().update(p);
		
	}
	@Override
	public void deleteproduct(String id) {
		sessionFactory.getCurrentSession().createQuery("delete from product where product_id = '"+id+"'").executeUpdate();
	}



}
