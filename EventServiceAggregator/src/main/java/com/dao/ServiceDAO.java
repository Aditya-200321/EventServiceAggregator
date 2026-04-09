package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.JoinRowSet;

import org.eclipse.jdt.internal.compiler.impl.CompilerStats;

import com.model.EventModel;
import com.model.ServiceModel;
import com.utility.DBConnection;

public class ServiceDAO  implements ServiceDetails{

	@Override
	public String insert(ServiceModel m) {
		Connection con = null;
		String status ="false";
		try {
		DBConnection db = new DBConnection();
	 con=	db.dbConnection();
	PreparedStatement ps = con.prepareStatement("insert into service (service_name,description,price) values(?,?,?)");
	ps.setString(1, m.getServiceName());
	ps.setString(2, m.getDescription());
	ps.setDouble(3, m.getPrice());
	 int n=ps.executeUpdate();
	 if(n>0) {
		 status="success";
	 }
		}catch(Exception e){
			
		}
		return status;
	}

	@Override
	public List<ServiceModel> getAllServices() {
		Connection con = null;

		List<ServiceModel> list = new ArrayList<>();

		try {
			DBConnection d1 = new DBConnection();
			con = d1.dbConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM service");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ServiceModel e = new ServiceModel();
				e.setServiceId(rs.getInt("service_id"));
				e.setServiceName(rs.getString("service_name"));
				e.setDescription(rs.getString("description"));
				e.setPrice(rs.getDouble("price"));

				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	@Override
	public ServiceModel selectById(int id) {
		ServiceModel e = null;

		try {
			Connection con = new DBConnection().dbConnection();
			PreparedStatement ps = con.prepareStatement("select * from service where service_id=?");

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				e = new ServiceModel();
				e.setServiceId(rs.getInt("service_id"));
				e.setServiceName(rs.getString("service_name"));
				e.setDescription(rs.getString("description"));
				e.setPrice(rs.getDouble("price"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	@Override
	public String update(ServiceModel s) {

		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con
					.prepareStatement("UPDATE service SET service_name=?, description=?, price=? WHERE service_id=?");

			ps.setString(1, s.getServiceName());
			ps.setString(2, s.getDescription());
			ps.setDouble(3, s.getPrice());
			ps.setInt(4, s.getServiceId());

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public String delete(int id) {
		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con.prepareStatement("DELETE FROM service WHERE service_id = ?");

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
	

	
	
	

}
