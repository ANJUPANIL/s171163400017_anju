package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.cart;



@Repository
public class cart_dao_impl implements cart_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<cart> getallcart(String userid) {
		return(List<cart>)sessionFactory.getCurrentSession().createQuery("from cart where user_name is'"+userid+"'").list();
	}

	@Override
	public void savecart(cart obj) {
		sessionFactory.getCurrentSession().save(obj);
		
	}

	@Override
	public void updatecart(cart cart) {
		sessionFactory.getCurrentSession().update(cart);
		
	}

	@Override
	public void deletecart(String id) {
		sessionFactory.getCurrentSession().createQuery("delete from cart where id = '"+id+"'").executeUpdate();
		
	}

	@Override
	public double gettotalamount(String userid) {
		String hql ="select sum(total) from cart where user_name = '"+userid+"' and status = "+"false";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		double sum = (Double) (query.uniqueResult());
		return sum;
	}

	@Override
	public void updatebyid(String id) {
		cart cart = new cart();
		cart.setId(id);
		sessionFactory.getCurrentSession().update(cart);
		
	}
	


}
