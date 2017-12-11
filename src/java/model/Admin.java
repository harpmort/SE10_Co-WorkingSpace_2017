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
public class Admin {

    List<Member> lapprove;
    private String username;
    private String password;

    Connection conn;

    public Admin() {
    }

    public Admin(Connection connection) {
        conn = connection;
        lapprove = new LinkedList<Member>();
    }

    public List<Member> getLapprove() {
        return lapprove;
    }

    public void importData(String username, String password) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * from admin where username='" + username + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    this.username = rs.getString("username");
                    this.password = rs.getString("password");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void apporveLessor() {
        try {
            Statement stmt = conn.createStatement();
            String sql = "select username,firstname,idcard from approve join member on fk_id_member = idmember where (idtype_member = 1 and approve_status = 'No Approve');";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Member approve = new Member();
                approve.setUsername(rs.getString("username"));
                approve.setFirstname(rs.getString("firstname"));
                approve.setIdcard(rs.getString("idcard"));
                lapprove.add(approve);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void apporvedLessor(String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "select idmember from member where username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            String idmember = "";
            if (rs.next()) {
                idmember = rs.getString("idmember");
            }

            String sql_approved = "UPDATE member\n"
                    + "SET approve_status = 'Approved'\n"
                    + "WHERE idmember = '" + idmember + "';";
            stmt.executeUpdate(sql_approved);

            sql_approved = "DELETE FROM db_coworkingspace.approve WHERE fk_id_member = '"+ idmember +"';";
            stmt.executeUpdate(sql_approved);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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

}
