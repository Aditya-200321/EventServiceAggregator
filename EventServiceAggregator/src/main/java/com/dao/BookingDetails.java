package com.dao;

import java.util.List;

import com.model.BookingModel;

public interface BookingDetails {
	public int insert(BookingModel b);
	public String insertBookingServices(int bookingId, String[] serviceIds);
	public List<BookingModel> getBookingsByCustomer(int cid);
	public String deleteBooking(int bookingId);
	public BookingModel getBookingById(int bookingId);
	public String updateBooking(BookingModel b);
	public List<BookingModel> getAllBookingsByAdmin();

}
