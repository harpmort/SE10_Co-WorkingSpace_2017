/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Asus
 */
public class Rental extends Member{
    List<Member> lbooking_user;
    private String idbooking;
    private String location_name;
    private String date;
    private String begin_time;
    private String end_time;
    private String desk_booking;
    
    List<Member> lhistory_user;
    private String idhistory;
    Connection conn;

    public Rental() {
    }

    public Rental(Connection connection) {
        super(connection);
        conn = connection;
        lbooking_user = new LinkedList<Member>();
        lhistory_user = new LinkedList<Member>();
    }

    public List<Member> getLbooking_user() {
        return lbooking_user;
    }
    
    public List<Member> getLhistory_user() {
        return lhistory_user;
    }
    
    public void viewListbooking(String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT b.idbooking,c.name,m.username,b.date,b.begin_time,b.end_time,b.desk_booking\n"
                    + "FROM booking b\n"
                    + "join member m \n"
                    + "on b.fk_idmember = m.idmember\n"
                    + "join co_working_space c\n"
                    + "on b.fk_idspace = c.idspace\n"
                    + "where m.username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Rental lb = new Rental();
                lb.setIdbooking(rs.getString("b.idbooking"));
                lb.setLocation_name(rs.getString("c.name"));
                lb.setUsername(rs.getString("m.username"));
                lb.setDate(rs.getString("b.date"));
                lb.setBegin_time(rs.getString("b.begin_time"));
                lb.setEnd_time(rs.getString("b.end_time"));
                lb.setDesk_booking(rs.getString("b.desk_booking"));
                lbooking_user.add(lb);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void viewListhistory(String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT h.idhistory,c.name,h.date,h.begin_time,h.end_time,h.desk_booking\n"
                    + "FROM history h\n"
                    + "join member m \n"
                    + "on h.fk_idmember = m.idmember\n"
                    + "join co_working_space c\n"
                    + "on h.fk_idspace = c.idspace\n"
                    + "where m.username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Rental lh = new Rental();
                lh.setIdhistory(rs.getString("h.idhistory"));
                lh.setLocation_name(rs.getString("c.name"));
                lh.setUsername(rs.getString("m.username"));
                lh.setDate(rs.getString("h.date"));
                lh.setBegin_time(rs.getString("h.begin_time"));
                lh.setEnd_time(rs.getString("h.end_time"));
                lh.setDesk_booking(rs.getString("h.desk_booking"));
                lhistory_user.add(lh);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public String getIdbooking() {
        return idbooking;
    }

    public void setIdbooking(String idbooking) {
        this.idbooking = idbooking;
    }

    public String getLocation_name() {
        return location_name;
    }

    public void setLocation_name(String location_name) {
        this.location_name = location_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBegin_time() {
        return begin_time;
    }

    public void setBegin_time(String begin_time) {
        this.begin_time = begin_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getDesk_booking() {
        return desk_booking;
    }

    public void setDesk_booking(String desk_booking) {
        this.desk_booking = desk_booking;
    }

    public String getIdhistory() {
        return idhistory;
    }

    public void setIdhistory(String idhistory) {
        this.idhistory = idhistory;
    }
    
}
