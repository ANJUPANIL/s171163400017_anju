package com.niit.ecommercemain.model;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Product")
@Component
public class product {
	@Id
	@Column(name="product_id")
	private String id;
	
	@Column(name="product_name")
	private String name;
	
	@Column(name="product_des")
	private String des;
	
	@Column(name="product_type")
	private String product_type;
	
	@Column(name="category_id")
	private String category_id;
	
	@Column(name="brand_id")
	private String brand_id;
	
	@Column(name="sup_id")
	private String sup_id;
	
	@Column(name="product_price")
	private int price;
	
	@Column(name="product_discount")
	private double discount;
	
	transient private MultipartFile prdfile;
	

	public MultipartFile getPrdfile() {
		return prdfile;
	}

	public void setPrdfile(MultipartFile prdfile) {
		this.prdfile = prdfile;
	}

	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	@Column(name="product_image")
	private String product_image;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getSup_id() {
		return sup_id;
	}

	public void setSup_id(String sup_id) {
		this.sup_id = sup_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	
	public String getFilePath(String path1,String contextPath)
	{
		String fileName=null;
		if(!prdfile.isEmpty())
		{
			try
			{
				fileName=prdfile.getOriginalFilename();
				byte[] bytes = prdfile.getBytes();
				String npath=path1+"\\WEB-INF\\resources\\"+fileName;
				System.out.print("path :" + npath);
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(npath)));
				buffStream.write(bytes);
				buffStream.close();
				String dbfilename=contextPath+"/resources/"+fileName;
				setProduct_image(dbfilename);
	           return dbfilename;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				return "fail";
			}
		}
		else
		{
			return "fail";
		}
	}

}
