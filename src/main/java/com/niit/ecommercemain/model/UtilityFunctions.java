package com.niit.ecommercemain.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.niit.ecommercemain.model.brand;

public class UtilityFunctions {

	@Autowired
	SessionFactory sessionFactory;
	
	public String getMaxBrandID(){
		
		Session session = sessionFactory.getCurrentSession();
		
		String SQL = "select nvl(max(substr(brand_id,2,3)),1) from brand";
		
		Query qry = session.createQuery(SQL);
		
		List lst = qry.list();
			
		System.out.println("res" + lst.get(0));
		String genBrandID = null;
		int maxid = (int)lst.get(0)==1 ? 1 : (int)lst.get(0)+1;
		System.out.println("Maxid" + maxid);
	/*	if(maxid < 9){
			genBrandID = "B00" + maxid;
		}
		else if(maxid >= 10 && maxid <= 99){
			genBrandID = "B0" + maxid;
		}
		else
		{
			genBrandID = "B" + maxid;
		}*/
		return "x"; 
	}
}
