
package com.niit.ecommercemain.dao;

import java.util.List;

import com.niit.ecommercemain.model.supplier;

public interface supplier_dao 
{
	public void savesupplier(supplier s);
	public List<supplier> allsupplier();
	public supplier getsupplierid(String id);
	public void updatesupplier(supplier s);
	public void deletesupplier(String id);
	
	
}
