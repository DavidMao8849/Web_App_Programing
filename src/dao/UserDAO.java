package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;

public class UserDAO {
    public boolean insert(String uid, String upass, String uname, String uphone) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user(id, password, name, phonenum) VALUES(?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, upass);
            stmt.setString(3, uname);
            stmt.setString(4, uphone);
		
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;

        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public boolean exists(String uid) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id FROM user WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);

            rs = stmt.executeQuery();
            return rs.next();

        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public boolean delete(String uid) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM user WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);

            int count = stmt.executeUpdate();
            return (count > 0) ? true : false;

        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    
    public int login(String uid, String upass) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, password FROM user WHERE id = ?";

            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);

            rs = stmt.executeQuery();
            if (!rs.next()) return 1;
            if (!upass.equals(rs.getString("password"))) return 2;
            return 0;
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<UserObj> getList() throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM user ORDER BY ts DESC";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            ArrayList<UserObj> users = new ArrayList<UserObj>();
            while(rs.next()) {
                users.add(new UserObj(rs.getString("id"), rs.getString("name"), rs.getString("ts")));
            }
            return users;
        } finally {
	        if (rs != null) rs.close();
	        if (stmt != null) stmt.close(); 
	        if (conn != null) conn.close();
	    }
	}
    
    public String findId(String name, String phonenum) throws NamingException, SQLException {
        String sql = "SELECT id FROM user WHERE name=? AND phonenum = ?";
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phonenum);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                return rs.getString("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
        return null;
    }
    public boolean checkUser(String uid, String uname, String phonenum) throws NamingException, SQLException {
        String sql = "SELECT * FROM user WHERE id=? AND name=? AND phonenum=?";
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, uname);
            stmt.setString(3, phonenum);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
        return false;
    }
    
    public boolean updatePassword(String id, String newPw) throws NamingException, SQLException {
        String sql = "UPDATE user SET password=? WHERE id=?";
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPw);
            stmt.setString(2, id);
            return stmt.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}    