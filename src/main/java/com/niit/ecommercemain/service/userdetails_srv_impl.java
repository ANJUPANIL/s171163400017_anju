package com.niit.ecommercemain.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecommercemain.dao.userdetails_dao;
import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;

@Service
@Transactional
public class userdetails_srv_impl implements userdetails_srv 
{
	@Autowired
	userdetails_dao cd;
	
	@Override
	public void saveuserdetails(userdetails userdetails) {
		
		cd.saveuserdetails(userdetails);
		
		
	}
	@Override
	public List<userdetails> alluserdetails() {
		return cd.alluserdetails();
		
	}
	
	@Override
	public userdetails getuserdetailsid(String id) {
		return cd.getuserdetailsid(id);
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	@Override
	public void updateuserdetails(userdetails userdetails) {
		
		cd.updateuserdetails(userdetails);
	}
	
	@Override
	public void deleteuserdetails(String id) {
		cd.deleteuserdetails(id);
		
	}

	@Override
	public boolean isvaliduser(String userid, String password) {
		return cd.isvaliduser(userid, password);
	}
	@Override
	public userlogin getdetailsbyid(String userid) {
		return cd.getdetailsbyid(userid);
	}
	@Override
	public void saveuser(String userid, String password) {
		
		cd.saveuser(userid, password);
	}

}
