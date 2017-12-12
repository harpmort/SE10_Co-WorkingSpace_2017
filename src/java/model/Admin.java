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
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class Admin {

    List<Member> lapprove;
    private String username;
    private String password;
    private List<Message> messages  = new ArrayList<>();

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
    public void markAsRead(int id) {
        try {
            Statement mr_statement = conn.createStatement();
            String mr_sql = "UPDATE message SET status = 1 WHERE idmessage = '"+ id +"';";
            mr_statement.executeUpdate(mr_sql);
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getUnReadMessage() {
        pullMessage();
        int unread = 0;
        for (int i = 0; i < getMessages().size(); i++) {
            if (getMessages().get(i).getStatus() == 0) {
                unread++;
            }
        }
        return unread;
    }
    public void pullMessage() {
        Message temp = new Message();
        if (messages.size() != 0) {
            messages.clear();
        }
        try {
            Statement message_statement = conn.createStatement();
            String message_sql = "select * from message where receiver = '"+ username +"';";
            ResultSet mrs = message_statement.executeQuery(message_sql);
            while (mrs.next()) {
                temp.setId(mrs.getInt("idmessage"));
                temp.setSender(mrs.getString("sender"));
                temp.setReceiver(mrs.getString("receiver"));
                temp.setDate(mrs.getString("date"));
                temp.setTime(mrs.getString("time"));
                temp.setMessage(mrs.getString("content"));
                temp.setStatus(mrs.getInt("status"));
                messages.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void sentMessage(Message message) {
        try {
            Statement sm_statement = conn.createStatement();
            String sm_sql = "INSERT INTO `db_coworkingspace`.`message` (`date`, `time`, `sender`, `receiver`, `content`) "
                            + "VALUES ('"+ message.getDate() +"', '"+ message.getTime()+"', '"+ message.getSender()+"', '"+ message.getReceiver()+"', '"+ message.getMessage()+"');";
            sm_statement.executeUpdate(sm_sql);
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void deleteMessage (int id){
        try {
            Statement del_statement = conn.createStatement();
            String del_sql = "DELETE FROM db_coworkingspace.message WHERE idmessage = '" + id + "';";
            del_statement.executeUpdate(del_sql);
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
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
        public List<Message> getMessages() {
        pullMessage();
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
    
    public List<Message> getMessagesByPass(){
        return messages;
    }

}
