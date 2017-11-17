/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Asus
 */
public class Space {

    List<Space> detail_space;
    private String name;
    private String location;
    private String type_room;
    private String type_desk;
    private String total_desk;
    private String amount_desk;
    private String description;
    private String size_room;
    private String open_time;
    private String close_time;
    private String amount_people;
    private String price;
    private String username;
    private String[] img;

    Connection conn;

    public Space() {
    }

    public Space(Connection connection) {
        conn = connection;
        detail_space = new LinkedList<Space>();
    }

    public List<Space> getDetail_space() {
        return detail_space;
    }

    public void search(String text) {
        try {
            Statement stmt = conn.createStatement();
            String sql = "select name,c.location,r.type_room,d.type_desk,c.total_desk,c.amount_desk,c.description\n"
                    + ",c.size_room,c.open_time,c.close_time,c.amount_people,c.price,m.username,c.img\n"
                    + "from co_working_space c\n"
                    + "join member m \n"
                    + "on c.fk_idmember = m.idmember\n"
                    + "join type_desk d\n"
                    + "on c.idtype_desk = d.idtype_desk\n"
                    + "join type_room r\n"
                    + "on c.idtype_room = r.idtype_room\n"
                    + "where name like \"%" + text + "%\"\n"
                    + "or c.location like \"" + text + "%\";";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Space space = new Space();
                space.setName(rs.getString("name"));
                space.setLocation(rs.getString("c.location"));
                space.setType_room(rs.getString("r.type_room"));
                space.setType_desk(rs.getString("d.type_desk"));
                space.setTotal_desk(rs.getString("c.total_desk"));
                space.setAmount_desk(rs.getString("c.amount_desk"));
                space.setDescription(rs.getString("c.description"));
                space.setSize_room(rs.getString("c.size_room"));
                space.setOpen_time(rs.getString("c.open_time"));
                space.setClose_time(rs.getString("c.close_time"));
                space.setAmount_people(rs.getString("c.amount_people"));
                space.setPrice(rs.getString("c.price"));
                space.setUsername(rs.getString("m.username"));
                space.setImg(rs.getString("img").replace("C:\\Users\\Asus\\Documents\\NetBeansProjects\\CoWorkingSpace\\web\\img\\", "img/").split(","));
                int count = space.getImg().length;
                for (int i = 0; i < count; i++) {
                    System.out.println("img :" + space.getImg()[0]);
                }
                detail_space.add(space);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void addSpace(String name,String location,String typeroom,String typedesk,String totaldesk,String amountdesk,String description,String roomsize,String open,String close,String people,String price,int idmember,InputStream inputStream){
        try {
            String sql = "INSERT INTO `db_coworkingspace`.`co_working_space` (`name`, `location`, `idtype_room`, `idtype_desk`, `total_desk`, `amount_desk`, `description`, `size_room`, `open_time`, `close_time`, `amount_people`, `price`, `fk_idmember`, `img`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, location); 
            stmt.setString(3, typeroom); 
            stmt.setString(4, typedesk); 
            stmt.setString(5, totaldesk); 
            stmt.setString(6, amountdesk); 
            stmt.setString(7, description); 
            stmt.setString(8, roomsize); 
            stmt.setString(9, open); 
            stmt.setString(10, close); 
            stmt.setString(11, people); 
            stmt.setString(12, price); 
            stmt.setInt(13, idmember); 
            stmt.setBlob(14, inputStream);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getType_room() {
        return type_room;
    }

    public void setType_room(String type_room) {
        this.type_room = type_room;
    }

    public String getType_desk() {
        return type_desk;
    }

    public void setType_desk(String type_desk) {
        this.type_desk = type_desk;
    }

    public String getTotal_desk() {
        return total_desk;
    }

    public void setTotal_desk(String total_desk) {
        this.total_desk = total_desk;
    }

    public String getAmount_desk() {
        return amount_desk;
    }

    public void setAmount_desk(String amount_desk) {
        this.amount_desk = amount_desk;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize_room() {
        return size_room;
    }

    public void setSize_room(String size_room) {
        this.size_room = size_room;
    }

    public String getOpen_time() {
        return open_time;
    }

    public void setOpen_time(String open_time) {
        this.open_time = open_time;
    }

    public String getClose_time() {
        return close_time;
    }

    public void setClose_time(String close_time) {
        this.close_time = close_time;
    }

    public String getAmount_people() {
        return amount_people;
    }

    public void setAmount_people(String amount_people) {
        this.amount_people = amount_people;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String[] getImg() {
        return img;
    }

    public void setImg(String[] img) {
        this.img = img;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

}
