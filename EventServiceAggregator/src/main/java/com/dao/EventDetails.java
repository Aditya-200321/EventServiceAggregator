package com.dao;

import java.util.List;

import com.model.EventModel;

public interface EventDetails {


	    public String insert(EventModel e);
	    public EventModel select(EventModel e);

	    public List<EventModel> getAllEvents();

	     public EventModel selectById(int id);

	    public String update(EventModel e);

	    public String delete(int id);
	


}
