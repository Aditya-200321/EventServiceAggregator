package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.AdminModel;
import com.model.BookingModel;
import com.utility.DBConnection;

public class AdminDAO implements AdminDetails {
	@Override
	public String select(AdminModel a) {

		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?");

			ps.setString(1, a.getEmail());
			ps.setString(2, a.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = "success"; // ✅ FIXED HERE
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	public List<BookingModel> getAllBookingsByAdmin() {

	    List<BookingModel> list = new ArrayList<>();

	    try {
	        Connection con = new DBConnection().dbConnection();

	        String sql =
	        "SELECT b.booking_id, b.customer_id, e.event_name, " +
	        "b.event_date, b.location " +
	        "FROM booking b " +
	        "JOIN events e ON b.event_id = e.event_id";

	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            BookingModel bm = new BookingModel();

	            bm.setBookingId(rs.getInt("booking_id"));
	            bm.setCustomerId(rs.getInt("customer_id"));
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