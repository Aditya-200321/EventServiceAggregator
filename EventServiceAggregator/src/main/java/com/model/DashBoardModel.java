package com.model;

import java.util.*;

public class DashBoardModel {

    private int totalCustomers;
    private int totalEvents;
    private int totalBookings;
    private double totalRevenue;

    private List<BookingModel> recentBookings = new ArrayList<>();

    public int getTotalCustomers(){
     return totalCustomers; 
    }
    public void setTotalCustomers(int totalCustomers){
     this.totalCustomers = totalCustomers; 
    }

    public int getTotalEvents() {
     return totalEvents; }
    public void setTotalEvents(int totalEvents) {
     this.totalEvents = totalEvents; 
    }

    public int getTotalBookings() {
     return totalBookings; 
    }
    public void setTotalBookings(int totalBookings){
    this.totalBookings = totalBookings;
    }

    public double getTotalRevenue() {
     return totalRevenue;
    }
    public void setTotalRevenue(double totalRevenue){
     this.totalRevenue = totalRevenue;
    }

    public List<BookingModel> getRecentBookings() {
     return recentBookings;
    }
    public void setRecentBookings(List<BookingModel> recentBookings) {
        this.recentBookings = recentBookings;
    }
}
