package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.CustomerModel;
import com.utility.DBConnection;

public class CustomerDAO  implements CustomerDetails{
	Connection con = null;

	@Override
	public String insert(CustomerModel c) {
		String status ="false";
		try {
			DBConnection d = new DBConnection();
			 con =d.dbConnection();
			 PreparedStatement ps = con.prepareStatement("insert into customer(customer_name,email,password,phone,address) values(?,?,?,?,?)");
			ps.setString(1, c.getCustomerName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPassword());
			ps.setString(4, c.getPhone());
			ps.setString(5, c.getAddress());
			int n = ps.executeUpdate();
			if(n>0) {
				status = "success";
			}
		}catch(Exception e) {
			
		}
		return status;
	}

	@Override
	public String select(CustomerModel c) {
		String status = "false";

		try {
			DBConnection d = new DBConnection();
			Connection con = d.dbConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE email = ? AND password = ?");

			ps.setString(1, c.getEmail());
			ps.setString(2, c.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = "success"; 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public int getCustomerIdByEmail(String email) {

	    int customerId = 0;

	    try {
	        DBConnection d = new DBConnection();
	        Connection con = d.dbConnection();

	        PreparedStatement ps =
	            con.prepareStatement("SELECT customer_id FROM customer WHERE email=?");

	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            customerId = rs.getInt("customer_id");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customerId;
	}
	public List<CustomerModel> getAllCustomersByAdmin(){

	    List<CustomerModel> list = new ArrayList<>();

	    try{
	        Connection con = new DBConnection().dbConnection();

	        String sql = "SELECT * FROM customer";

	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            CustomerModel c = new CustomerModel();

	            c.setCustomerId(rs.getInt("customer_id"));
	            c.setCustomerName(rs.getString("customer_name"));
	            c.setEmail(rs.getString("email"));
	            c.setPhone(rs.getString("phone"));
	            c.setAddress(rs.getString("address"));

	            list.add(c);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}


		

}
