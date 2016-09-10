package com.niit.ecommercemain.dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;

@Repository
public class product_dao_impl implements product_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public void saveproduct(product p) {
		p.setStatus(true);
		sessionFactory.getCurrentSession().save(p);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<product> allproduct() {
		return (List<product>)sessionFactory.getCurrentSession().createQuery("from product where status=true").list();
	}
	@Override
	public product getproductid(String id) {
		return (product) sessionFactory.getCurrentSession().get(product.class, new String(id));
	
	}
	@Override
	public void updateproduct(product p) {
		p.setStatus(true);
		sessionFactory.getCurrentSession().update(p);
		
	}
	@Override
	public void deleteproduct(String id) {
		sessionFactory.getCurrentSession().createQuery("update product set status=false where product_id = '"+id+"'").executeUpdate();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<product> getcategorylist(String categoryname) {
		System.out.println("DAO "+categoryname);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("Select p from product p join p.categoryobj c where " +  
					" c.name = '" + categoryname + "' and p.status=true");
		return (List<product>) query.list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<product> getbrandlist(String categoryname, String brandname) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("Select p from product p join p.categoryobj c where " +  
					" c.name = '" + categoryname + "' and p.status=TRUE and" + " c.brands.brand_name = '" + brandname +"'");
		return (List<product>) query.list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<product> getproductbytype(String type) {
		
		return (List<product>)sessionFactory.getCurrentSession().createQuery("from product where status=true and product_type='" + type +"'").list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<product> productbyname(String pname) {
		return (List<product>)sessionFactory.getCurrentSession().createQuery("from product where status=true and name='" + pname +"'").list();
	}

	
	
}







