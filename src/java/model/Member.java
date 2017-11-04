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
public class Member {

    private int idmember;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String email;
    private String phone;
    private int type;
    
    List<Member> lbooking_user;
    private String idbooking;
    private String location_name;
    private String date;
    private String begin_time;
    private String end_time;
    private String desk_booking;

    Connection conn;

    public Member() {
    }
    public Member(Connection connection) {
        conn = connection;
        lbooking_user = new LinkedList<Member>();
    }
    
    public List<Member> getLbooking_user() {
        return lbooking_user;
    }

    public void importData(String username, String password) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * from member where username='" + username + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    this.username = rs.getString("username");
                    this.password = rs.getString("password");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    email = rs.getString("email");
                    phone = rs.getString("phone");
                    type = rs.getInt("idtype_member");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void register(String firstname, String lastname, String username, String password, String email, String phone, int type) {
        try {
            Statement stmt = conn.createStatement();
            if (type == 2) {
                String sql = "INSERT INTO `db_coworkingspace`.`member` (`firstname`, `lastname`, `username`, `password`, `email`, `phone`, `idtype_member`) "
                        + "VALUES ('" + firstname + "', '" + lastname + "', '" + username + "', '" + password + "', '" + email + "', '" + phone + "', '" + type + "');";
                stmt.executeUpdate(sql);
            } else {
                String sql = "INSERT INTO `db_coworkingspace`.`list_supply` (`firstname`, `lastname`, `username`, `password`, `email`, `phone`) "
                        + "VALUES ('" + firstname + "', '" + lastname + "', '" + username + "', '" + password + "', '" + email + "', '" + phone + "');";
                stmt.executeUpdate(sql);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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
            while (rs.next()){
                Member lb = new Member();
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

    public int getIdmember() {
        return idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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
    
    

}
