package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.niit.ecommercemain.model.orderdetails;



@Repository
public class orderdetails_dao_impl implements orderdetails_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void saveorderdetails(orderdetails cat) {
		cat.setStatus("d");
		sessionFactory.getCurrentSession().save(cat);
		
	}

	
	@Override
	public void updateorderdetails(orderdetails cat) {
		
		sessionFactory.getCurrentSession().update(cat);
		
		
	}
	@Override
	public void deleteorderdetails(String id) {
		sessionFactory.getCurrentSession().createQuery("update orderdetails set status=false where orderdetails_id = '"+id+"'").executeUpdate();
		
	}

	@Override
	@SuppressWarnings("unchecked" )
	public List<orderdetails> getallorderdetails(String userid) {
		return (List<orderdetails>)sessionFactory.getCurrentSession().createQuery("from orderdetails where user_id='"+userid+"'").list();
	}
	
	

	
	

		
	


}
