package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.category;

public interface category_srv {
	
	public void savecategory(category cat);
	
	public List<category> allcategory();
	
	public category getcategoryid(String id);
	
	public void updatecategory(category cat);
	
	public void deletecategory(String id);
	
	public List<category> getbrandlist(String categoryname);

}
