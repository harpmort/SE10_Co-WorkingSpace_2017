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
public class Rental extends Member {

    List<Member> lbooking;
    private String idbooking;
    private String location_name;
    private String date;
    private String begin_time;
    private String end_time;
    private String desk_booking;

    List<Member> lhistory;
    private String idhistory;
    Connection conn;

    public Rental() {
    }

    public Rental(Connection connection) {
        super(connection);
        conn = connection;
        lbooking = new LinkedList<Member>();
        lhistory = new LinkedList<Member>();
    }

    public List<Member> getLbooking() {
        return lbooking;
    }

    public List<Member> getLhistory() {
        return lhistory;
    }

    public void viewListbooking(String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT b.idbooking,c.name,ml.username,b.date,b.begin_time,b.end_time,b.desk_booking\n"
                    + "FROM booking b\n"
                    + "join member m \n"
                    + "on b.fk_idmember = m.idmember\n"
                    + "join co_working_space c\n"
                    + "on b.fk_idspace = c.idspace\n"
                    + "join member ml\n"
                    + "on ml.idmember = c.fk_idmember\n"
                    + "where m.username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Rental lb = new Rental();
                lb.setIdbooking(rs.getString("b.idbooking"));
                lb.setLocation_name(rs.getString("c.name"));
                lb.setUsername(rs.getString("ml.username"));
                lb.setDate(rs.getString("b.date"));
                lb.setBegin_time(rs.getString("b.begin_time"));
                lb.setEnd_time(rs.getString("b.end_time"));
                lb.setDesk_booking(rs.getString("b.desk_booking"));
                lbooking.add(lb);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void cancelBooking(String id_booking) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT *\n"
                    + "FROM booking b\n"
                    + "where idbooking = '" + id_booking + "';";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            String id_b = rs.getString("idbooking");
            Statement stmt_id_b = conn.createStatement();
            String sql_id_b = "DELETE FROM db_coworkingspace.booking WHERE idbooking = '" + id_b + "';";
            stmt_id_b.executeUpdate(sql_id_b);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void reserSpace(String date, String time_start, String time_end, String amount, String s_name, String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT idspace\n"
                    + "FROM co_working_space c\n"
                    + "where name = '" + s_name + "';";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            String idspace = rs.getString("idspace");

            Statement stmt_user = conn.createStatement();
            String sql_user = "SELECT idmember\n"
                    + "FROM member m\n"
                    + "where username = '" + username + "';";
            ResultSet rs_user = stmt_user.executeQuery(sql_user);
            rs_user.next();
            String idmember = rs_user.getString("idmember");

            String[] date_split = date.split("-");
            int count_split = date_split.length;
            String date_reverse = "";
            for(int i =0;count_split-1>=i;count_split--){
                date_reverse += date_split[count_split-1];
                date_reverse += "-";
            }
            
            Statement stmt_reser = conn.createStatement();
            String sql_reser = "INSERT INTO db_coworkingspace.booking(date, begin_time, end_time, desk_booking, fk_idmember, fk_idspace) \n"
                    + "	VALUES ('" + date_reverse + "', '" + time_start + "', '" + time_end + "', '" + amount + "', '" + idmember + "', '" + idspace + "');";
            stmt_reser.executeUpdate(sql_reser);

            

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void viewListhistory(String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT h.idhistory,c.name,h.date,h.begin_time,h.end_time,h.desk_booking,ml.username\n"
                    + "FROM history h\n"
                    + "join member m \n"
                    + "on h.fk_idmember = m.idmember\n"
                    + "join co_working_space c\n"
                    + "on h.fk_idspace = c.idspace\n"
                    + "join member ml\n"
                    + "on c.fk_idmember = ml.idmember\n"
                    + "where m.username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Rental lh = new Rental();
                lh.setIdhistory(rs.getString("h.idhistory"));
                lh.setLocation_name(rs.getString("c.name"));
                lh.setUsername(rs.getString("ml.username"));
                lh.setDate(rs.getString("h.date"));
                lh.setBegin_time(rs.getString("h.begin_time"));
                lh.setEnd_time(rs.getString("h.end_time"));
                lh.setDesk_booking(rs.getString("h.desk_booking"));
                lhistory.add(lh);
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
