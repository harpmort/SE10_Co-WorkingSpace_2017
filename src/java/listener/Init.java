/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;
/**
 *
 * @author Asus
 */
public class Init implements ServletContextListener {
    private Connection conn;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            conn = getDb_cws().getConnection();
            sce.getServletContext().setAttribute("connection", conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private DataSource getDb_cws() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/db_cws");
}
}
