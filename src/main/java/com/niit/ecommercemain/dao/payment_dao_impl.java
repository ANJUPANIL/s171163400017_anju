package com.niit.ecommercemain.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.payment;

@Repository
public class payment_dao_impl implements payment_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void savepayment(payment payment) {
		
		sessionFactory.getCurrentSession().save(payment);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<payment> getallpayment(String userid) {
		return (List<payment>)sessionFactory.getCurrentSession().createQuery("from payment user_id='"+ userid+"'").list();
	}
	
	
	
	@Override
	public void updatepayment(payment payment) {
		
		sessionFactory.getCurrentSession().update(payment);
		
	}

	@Override
	public payment getpaymentbyid(String id) {
		
			return (payment) sessionFactory.getCurrentSession().get(payment.class, new String(id));
		
	}
	
	
	

}
