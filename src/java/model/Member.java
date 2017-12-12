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
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private String checkemail;
    private String img_user;
    private String idcard;
    private String status_approve;
    private List<Message> messages;

    Connection conn;

    public Member() {
    }

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
                    this.username = rs.getString("username");
                    this.password = rs.getString("password");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    email = rs.getString("email");
                    phone = rs.getString("phone");
                    type = rs.getInt("idtype_member");
                    img_user = rs.getString("img_profile");
                    idcard = rs.getString("idcard");
                    status_approve = rs.getString("approve_status");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void register(String firstname, String lastname, String username, String password, String email, String phone, int type, String img, String idcard) {
        try {
            Statement check_email = conn.createStatement();
            String sql_ce = "SELECT email from member ";
            ResultSet ce = check_email.executeQuery(sql_ce);
            checkemail = "isEmailUnused";;
            while (ce.next()) {
                if (email.equals(ce.getString("email"))) {
                    checkemail = "isEmailExisted";
                } else {
                    checkemail = "isEmailUnused";
                }
            }

            Statement stmt = conn.createStatement();
            if (img.equals("")) {
                img = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\CoWorkingSpace\\web\\img\\user.png";
            }
            if (idcard.equals("")) {
                idcard = "Not verified";
            }
            if (!checkemail.equals("isEmailExisted")) {
                if (type == 2) {
                    String status_approve = "Approved";
                    String sql = "INSERT INTO `db_coworkingspace`.`member` (`firstname`, `lastname`, `username`, `password`, `email`, `phone`, `idtype_member`, `img_profile`, `idcard`, approve_status) "
                            + "VALUES ('" + firstname + "', '" + lastname + "', '" + username + "', '" + password + "', '" + email + "', '" + phone + "', '" + type + "', '" + img + "', '" + idcard + "', '" + status_approve + "');";
                    stmt.executeUpdate(sql);
                } else {
                    String sql = "INSERT INTO `db_coworkingspace`.`member` (`firstname`, `lastname`, `username`, `password`, `email`, `phone`, `idtype_member`, `img_profile`, `idcard`) "
                            + "VALUES ('" + firstname + "', '" + lastname + "', '" + username + "', '" + password + "', '" + email + "', '" + phone + "', '" + type + "', '" + img + "', '" + idcard + "');";
                    stmt.executeUpdate(sql);
                    Statement stmt_approve = conn.createStatement();
                    String sql_approve = "select idmember from member where username = '" + username + "'";
                    ResultSet rs_approve = check_email.executeQuery(sql_approve);
                    if (rs_approve.next()) {
                        String idmember = rs_approve.getString("idmember");
                        sql = "INSERT INTO `db_coworkingspace`.`approve` (fk_id_member) "
                                + "VALUES ('" + idmember + "');";
                        stmt_approve.executeUpdate(sql);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editProfile(String firstname, String lastname, String email, String phone, String path_img, String path_card, String username) {
        try {
            Statement stmt = conn.createStatement();
            String sql_id = "select idmember from member where username = '" + username + "';";
            ResultSet rs = stmt.executeQuery(sql_id);
            String idmember = "";
            if (rs.next()) {
                idmember = rs.getString("idmember");
            }

            if (!firstname.equals("-") && !firstname.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET firstname = '" + firstname + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.firstname = firstname;
            }

            if (!lastname.equals("-") && !lastname.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET lastname = '" + lastname + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.lastname = lastname;
            }

            if (!email.equals("-") && !email.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET email = '" + email + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.email = email;
            }

            if (!phone.equals("-") && !phone.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET phone = '" + phone + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.phone = phone;
            }

            if (!path_img.equals("-") && !path_img.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET img_profile = '" + path_img + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.img_user = path_img;
            }

            if (!path_card.equals("-") && !path_card.equals("")) {
                String sql = "UPDATE member\n"
                        + "SET idcard = '" + path_card + "'\n"
                        + "WHERE idmember = '" + idmember + "';";
                stmt.executeUpdate(sql);
                this.idcard = path_card;
            }

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
            String message_sql = "select * from message where username = '"+ username +"';";
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

    public String getCheckemail() {
        return checkemail;
    }

    public void setCheckemail(String checkemail) {
        this.checkemail = checkemail;
    }

    public String getImg_user() {
        return img_user;
    }

    public void setImg_user(String img_user) {
        this.img_user = img_user;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getStatus_approve() {
        return status_approve;
    }

    public void setStatus_approve(String status_approve) {
        this.status_approve = status_approve;
    }

    public List<Message> getMessages() {
        pullMessage();
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

}
