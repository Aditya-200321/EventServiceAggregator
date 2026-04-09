package com.dao;

import java.util.List;

import com.model.EventModel;
import com.model.ServiceModel;

public interface ServiceDetails {
	public String insert(ServiceModel s);
	 public List<ServiceModel> getAllServices();
	 public ServiceModel selectById(int id);
	  public String update(ServiceModel s);
	  public String delete(int id);

}
