package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.supplier;

public interface supplier_srv {
	
	public void savesupplier(supplier cat);
	public List<supplier> allsupplier();
	public supplier getsupplierid(String id);
	public void updatesupplier(supplier cat);
	public void deletesupplier(String id);

}
