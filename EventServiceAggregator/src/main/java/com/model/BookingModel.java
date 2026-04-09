package com.model;

public class BookingModel {
	

	    private int bookingId;
	    private int customerId;
	    private int eventId;
	    private String eventDate;
	    private String location;
	    private String customerName;
	    private String eventName;


	    public int getBookingId() {
	        return bookingId;
	    }

	    public void setBookingId(int bookingId) {
	        this.bookingId = bookingId;
	    }

	    public int getCustomerId() {
	        return customerId;
	    }

	    public void setCustomerId(int customerId) {
	        this.customerId = customerId;
	    }

	    public int getEventId() {
	        return eventId;
	    }

	    public void setEventId(int eventId) {
	        this.eventId = eventId;
	    }

	    public String getEventDate() {
	        return eventDate;
	    }

	    public void setEventDate(String eventDate) {
	        this.eventDate = eventDate;
	    }

	    public String getLocation() {
	        return location;
	    }

	    public void setLocation(String location) {
	        this.location = location;
	    }

		public String getCustomerName() {
			return customerName;
		}

		public void setCustomerName(String customerName) {
			this.customerName = customerName;
		}

		public String getEventName() {
			return eventName;
		}

		public void setEventName(String eventName) {
			this.eventName = eventName;
		}
	    
	}



