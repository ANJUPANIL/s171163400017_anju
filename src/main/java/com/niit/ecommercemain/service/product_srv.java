package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.category;
import com.niit.ecommercemain.model.product;

public interface product_srv {
	
	public void saveproduct(product p);
	
	public List<product> allproduct();
	
	public product getproductid(String id);
	
	public void updateproduct(product p);
	
	public void deleteproduct(String id);
	
	public List<product> getcategorylist(String categoryname);
	
	public List<product> getbrandlist(String categoryname,String brandname);
	
	public List<product> getproductbytype(String type);
	
	public List<product> productbyname(String pname);
}
