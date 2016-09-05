package com.niit.ecommercemain.model;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	
	@OneToOne
	@JoinColumn(name="category_id")
	private category categoryobj ;
	
	public category getCategoryobj() {
		return categoryobj;
	}

	public void setCategoryobj(category categoryobj) {
		this.categoryobj = categoryobj;
	}

	public brand getBrands() {
		return brands;
	}

	public void setBrands(brand brands) {
		this.brands = brands;
	}

	public supplier getSup() {
		return sup;
	}

	public void setSup(supplier sup) {
		this.sup = sup;
	}

	@OneToOne
	@JoinColumn(name="brand_id")
	private brand brands;
	
	@OneToOne
	@JoinColumn(name="sup_id")
	private supplier sup ;
	
	
	@Column(name="product_price")
	private int price;
	
	@Column(name="product_discount")
	private double discount;
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	transient private MultipartFile prdfile;
	
	 @Column(name="status")
	 private boolean status;
	

	public MultipartFile getPrdfile() {
		return prdfile;
	}

	public void setPrdfile(MultipartFile prdfile) {
		this.prdfile = prdfile;
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
