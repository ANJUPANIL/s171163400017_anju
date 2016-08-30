package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.brand;



@Repository
public class brand_dao_impl implements brand_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void savebrand(brand brand) {
		brand.setStatus(true);
		sessionFactory.getCurrentSession().save(brand);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<brand> allbrand() {
		return (List<brand>)sessionFactory.getCurrentSession().createQuery("from brand where status=true").list();
	}
	
	@Override
	public brand getbrandid(String id) {
		return (brand) sessionFactory.getCurrentSession().get(brand.class, new String(id));
	}
	
	@Override
	public void updatebrand(brand brand) {
		brand.setStatus(true);
		sessionFactory.getCurrentSession().update(brand);
		
	}
	
	@Override
	public void deletebrand(String id) {
		sessionFactory.getCurrentSession().createQuery("update brand set status=false where brand_id = '"+id+"'").executeUpdate();
		
	}
	
	
}
