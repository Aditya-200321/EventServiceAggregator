package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.EventModel;
import com.model.ServiceModel;
import com.utility.DBConnection;

public class EventDAO implements EventDetails {

	@Override
	public String insert(EventModel e) {

		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con
					.prepareStatement("INSERT INTO event(event_name, description, price) VALUES (?,?,?)");

			ps.setString(1, e.getEventName());
			ps.setString(2, e.getDescription());
			ps.setDouble(3, e.getPrice());

			int n = ps.executeUpdate();

			System.out.println("Rows Inserted = " + n);

			if (n > 0) {
				status = "success";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public List<EventModel> getAllEvents() {
		Connection con = null;

		List<EventModel> list = new ArrayList<>();

		try {
			DBConnection d1 = new DBConnection();
			con = d1.dbConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM event");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				EventModel e = new EventModel();
				e.setEventId(rs.getInt("event_id"));
				e.setEventName(rs.getString("event_name"));
				e.setDescription(rs.getString("description"));
				e.setPrice(rs.getDouble("price"));

				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public EventModel selectById(int id) {
		EventModel e = null;

		try {
			Connection con = new DBConnection().dbConnection();
			PreparedStatement ps = con.prepareStatement("select * from event where event_id=?");

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				e = new EventModel();
				e.setEventId(rs.getInt("event_id"));
				e.setEventName(rs.getString("event_name"));
				e.setDescription(rs.getString("description"));
				e.setPrice(rs.getDouble("price"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	@Override
	public String update(EventModel e) {

		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con
					.prepareStatement("UPDATE event SET event_name=?, description=?, price=? WHERE event_id=?");

			ps.setString(1, e.getEventName());
			ps.setString(2, e.getDescription());
			ps.setDouble(3, e.getPrice());
			ps.setInt(4, e.getEventId());

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public String delete(int id) {

		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con.prepareStatement("DELETE FROM event WHERE event_id = ?");

			ps.setInt(1, id);

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public EventModel select(EventModel e) {
		return null;
	}

	

}
