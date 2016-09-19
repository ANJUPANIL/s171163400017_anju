package com.niit.ecommercemain.dao;

import java.util.List;

import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;

public interface userdetails_dao {
	public List<userdetails> alluserdetails();
	public void saveuserdetails(userdetails details);
	public void updateuserdetails(userdetails details);
	public void deleteuserdetails(String name);
	public userdetails getuserdetailsid(String id);
	
	public boolean isvaliduser(String userid,String password);
	public userlogin getdetailsbyid(String userid); 
	public void saveuser(String userid,String password);
	public void updatepassword(String userid,String password);
	

}
