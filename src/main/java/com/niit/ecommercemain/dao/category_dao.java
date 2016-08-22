
package com.niit.ecommercemain.dao;

import java.util.List;

import com.niit.ecommercemain.model.category;

public interface category_dao 
{
	public void savecategory(category cat);
	public List<category> allcategory();
	public category getcategoryid(String id);
	public void updatecategory(category cat);
	public void deletecategory(String id);
	
	
}
