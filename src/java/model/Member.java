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
    
    Connection conn;
    
    public Member(Connection connection) {
        conn = connection;
    }
    
    public void importData(String username, String password) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * from member where username='" + username + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    firstname = (rs.getString("firstname"));
                    lastname = (rs.getString("lastname"));
                    email = (rs.getString("email"));
                    phone = (rs.getString("phone"));
                    type = (rs.getInt("type"));
                }
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
    
    
    
    
}
