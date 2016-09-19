package com.niit.ecommercemain.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;

@Repository
public class userdetails_dao_impl implements userdetails_dao
{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveuserdetails(userdetails userdetails) {
		
		sessionFactory.getCurrentSession().save(userdetails);
		
	}

	@SuppressWarnings("unchecked" )
	@Override
	public List<userdetails> alluserdetails() {
		return (List<userdetails>)sessionFactory.getCurrentSession().createQuery("from userdetails").list();
	}
	
	@Override
	public userdetails getuserdetailsid(String id) {
		return (userdetails) sessionFactory.getCurrentSession().get(userdetails.class, new String(id));
	}
	
	@Override
	public void updateuserdetails(userdetails userdetails) {
		sessionFactory.getCurrentSession().update(userdetails);
		
		
	}
	
	@Override
	public void deleteuserdetails(String id) {
		sessionFactory.getCurrentSession().createQuery("delete from userdetails where user_id = '"+id+"'").executeUpdate();
		
	}
	
	@Override
	public boolean isvaliduser(String userid, String password) {
		userlogin u = (userlogin) sessionFactory.getCurrentSession().get(userlogin.class, new String(userid));
		if(u.getUser_id().equals(userid) && u.getPassword().equals(password))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public userlogin getdetailsbyid(String userid) {
		return (userlogin) sessionFactory.getCurrentSession().get(userlogin.class, new String(userid));
	}

	@Override
	public void saveuser(String userid, String password) {

		userlogin u = new userlogin();
		u.setUser_id(userid);
		u.setPassword(password);
		sessionFactory.getCurrentSession().save(u);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void updatepassword(String userid, String password) {
		
		sessionFactory.getCurrentSession().createQuery("update userlogin set password=password where user_id = '"+userid+"'").executeUpdate();
	}

	
	
	
}
