package com.dao;

import java.util.List;

import com.model.CustomerModel;

public interface CustomerDetails {
	public String insert(CustomerModel c);
	public String select(CustomerModel c);
	 public int getCustomerIdByEmail(String email);
	 public List<CustomerModel> getAllCustomersByAdmin();


}
