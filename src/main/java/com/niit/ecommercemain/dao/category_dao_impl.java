package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.brand;
import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;



@Repository
public class category_dao_impl implements category_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void savecategory(category cat) {
		cat.setStatus(true);
		sessionFactory.getCurrentSession().save(cat);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<category> allcategory() {
		return (List<category>)sessionFactory.getCurrentSession().createQuery("from category where status=true").list();
	}
	@Override
	public category getcategoryid(String id) {
		return (category) sessionFactory.getCurrentSession().get(category.class, new String(id));
	
	}
	@Override
	public void updatecategory(category cat) {
		cat.setStatus(true);
		sessionFactory.getCurrentSession().update(cat);
		
		
	}
	@Override
	public void deletecategory(String id) {
		sessionFactory.getCurrentSession().createQuery("update category set status=false where category_id = '"+id+"'").executeUpdate();
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<category> getbrandlist(String categoryname)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("Select c from category c join c.brands b where " +  
					" c.name = '" + categoryname + "' and b.status=true");
		return (List<category>) query.list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<category> categorynamelist() {
		
		return (List<category>)sessionFactory.getCurrentSession().createQuery("SELECT DISTINCT name FROM category where status=true order by name asc").list();
		
	}

	
	

		
	


}
