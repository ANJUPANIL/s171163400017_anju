package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.brand;

public interface brand_srv {
	
	public void savebrand(brand brand);
	public List<brand> allbrand();
	public brand getbrandid(String id);
	public void updatebrand(brand brand);
	public void deletebrand(String id);

}
