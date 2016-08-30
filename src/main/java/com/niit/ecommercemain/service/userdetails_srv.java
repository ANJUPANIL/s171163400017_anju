package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.userdetails;
import com.niit.ecommercemain.model.userlogin;

public interface userdetails_srv {
	
	public void saveuserdetails(userdetails userdetails);
	public List<userdetails> alluserdetails();
	public userdetails getuserdetailsid(String id);
	public void updateuserdetails(userdetails userdetails);
	public void deleteuserdetails(String id);
	
	public boolean isvaliduser(String userid,String password);
	public userlogin getdetailsbyid(String userid); 
	public void saveuser(String userid,String password);

}
