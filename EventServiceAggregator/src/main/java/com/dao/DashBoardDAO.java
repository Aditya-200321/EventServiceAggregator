package com.dao;

import java.sql.*;
import java.util.*;

import com.model.*;
import com.utility.DBConnection;

public class DashBoardDAO {

    public DashBoardModel getStatus(){

        DashBoardModel stats = new DashBoardModel();

        try{
            Connection con = new DBConnection().dbConnection();

            ResultSet rs1 = con.createStatement()
                    .executeQuery("SELECT COUNT(*) FROM customer");
            if(rs1.next())
                stats.setTotalCustomers(rs1.getInt(1));

            ResultSet rs2 = con.createStatement()
                    .executeQuery("SELECT COUNT(*) FROM event");
            if(rs2.next())
                stats.setTotalEvents(rs2.getInt(1));

            ResultSet rs3 = con.createStatement()
                    .executeQuery("SELECT COUNT(*) FROM booking");
            if(rs3.next())
                stats.setTotalBookings(rs3.getInt(1));

            ResultSet rs4 = con.createStatement()
                    .executeQuery("SELECT IFNULL(SUM(price),0) FROM service");
            if(rs4.next())
                stats.setTotalRevenue(rs4.getDouble(1));

            String sql =
            "SELECT booking_id, customer_id, event_date, location " +
            "FROM booking ORDER BY booking_id DESC LIMIT 5";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs5 = ps.executeQuery();

            List<BookingModel> list = new ArrayList<>();

            while(rs5.next()){
                BookingModel b = new BookingModel();
                b.setBookingId(rs5.getInt("booking_id"));
                b.setCustomerId(rs5.getInt("customer_id"));
                b.setEventDate(rs5.getString("event_date"));
                b.setLocation(rs5.getString("location"));
                list.add(b);
            }

            stats.setRecentBookings(list);

        }catch(Exception e){
            e.printStackTrace();
        }

        return stats;
    }
}
