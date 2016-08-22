package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.category;



@Repository
public class category_dao_impl implements category_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void savecategory(category cat) {
		
		sessionFactory.getCurrentSession().save(cat);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<category> allcategory() {
		return (List<category>)sessionFactory.getCurrentSession().createQuery("from category").list();
	}
	@Override
	public category getcategoryid(String id) {
		return (category) sessionFactory.getCurrentSession().get(category.class, new String(id));
	
	}
	@Override
	public void updatecategory(category cat) {
		sessionFactory.getCurrentSession().update(cat);
		
	}
	@Override
	public void deletecategory(String id) {
		sessionFactory.getCurrentSession().createQuery("delete from category where category_id = '"+id+"'").executeUpdate();
	}



}
