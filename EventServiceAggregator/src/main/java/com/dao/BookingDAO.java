package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.BookingModel;
import com.utility.DBConnection;

public class BookingDAO implements BookingDetails {

    @Override
    public int insert(BookingModel b) {

        int bookingId = 0;

        try {
            Connection con = new DBConnection().dbConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO booking(customer_id,event_id,event_date,location) VALUES(?,?,?,?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, b.getCustomerId());
            ps.setInt(2, b.getEventId());
            ps.setString(3, b.getEventDate());
            ps.setString(4, b.getLocation());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                bookingId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookingId;
    }

   
    @Override
    public String insertBookingServices(int bookingId, String[] serviceIds) {

        String status = "false";

        try {
            Connection con = new DBConnection().dbConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO booking_services(booking_id,service_id) VALUES(?,?)"
            );

            for (String sid : serviceIds) {

                ps.setInt(1, bookingId);
                ps.setInt(2, Integer.parseInt(sid));
                ps.executeUpdate();
            }

            status = "success";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


	@Override
	public List<BookingModel> getBookingsByCustomer(int cid) {
		 List<BookingModel> list = new ArrayList<>();

		    try {

		        Connection con = new DBConnection().dbConnection();

		        String sql =
		        "SELECT booking_id, customer_id, event_id, event_date, location " +
		        "FROM booking WHERE customer_id=?";

		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, cid);

		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            BookingModel b = new BookingModel();

		            b.setBookingId(rs.getInt("booking_id"));
		            b.setCustomerId(rs.getInt("customer_id"));
		            b.setEventId(rs.getInt("event_id"));
		            b.setEventDate(rs.getString("event_date"));
		            b.setLocation(rs.getString("location"));

		            list.add(b);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}
	// DELETE BOOKING
	public String deleteBooking(int bookingId) {

	    String status = "false";

	    try {
	    	Connection con = new DBConnection().dbConnection();

	        PreparedStatement ps =
	                con.prepareStatement(
	                "DELETE FROM booking WHERE booking_id=?");

	        ps.setInt(1, bookingId);

	        int n = ps.executeUpdate();

	        if(n > 0){
	            status = "success";
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return status;
	}


	@Override
	public BookingModel getBookingById(int id) {

	    BookingModel b = null;

	    try {
	        Connection con = new DBConnection().dbConnection();

	        String sql = "SELECT * FROM booking WHERE booking_id=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            b = new BookingModel();
	            b.setBookingId(rs.getInt("booking_id"));
	            b.setCustomerId(rs.getInt("customer_id"));
	            b.setEventId(rs.getInt("event_id"));
	            b.setEventDate(rs.getString("event_date"));
	            b.setLocation(rs.getString("location"));
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return b;
	}


	

	


	@Override
	public String updateBooking(BookingModel b){

	    String status="fail";

	    try{
	        Connection con = new DBConnection().dbConnection();

	        String sql =
	        "UPDATE booking SET event_id=?, event_date=?, location=? " +
	        "WHERE booking_id=? AND customer_id=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, b.getEventId());
	        ps.setString(2, b.getEventDate());
	        ps.setString(3, b.getLocation());
	        ps.setInt(4, b.getBookingId());
	        ps.setInt(5, b.getCustomerId());

	        int n = ps.executeUpdate();

	        if(n>0)
	            status="success";

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return status;
	}
	public List<BookingModel> getAllBookingsByAdmin() {

	    List<BookingModel> list = new ArrayList<>();

	    try {
	        Connection con = new DBConnection().dbConnection();

	        String sql =
	        "SELECT b.booking_id, " +
	        "c.customer_name, " +
	        "e.event_name, " +
	        "b.event_date, " +
	        "b.location " +
	        "FROM booking b " +
	        "JOIN customer c ON b.customer_id = c.customer_id " +
	        "JOIN event e ON b.event_id = e.event_id";   

	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            BookingModel bm = new BookingModel();

	            bm.setBookingId(rs.getInt("booking_id"));
	            bm.setCustomerName(rs.getString("customer_name"));
	            bm.setEventName(rs.getString("event_name"));
	            bm.setEventDate(rs.getString("event_date"));
	            bm.setLocation(rs.getString("location"));

	            list.add(bm);
	        }

	    } catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}

	


	}




	


	

