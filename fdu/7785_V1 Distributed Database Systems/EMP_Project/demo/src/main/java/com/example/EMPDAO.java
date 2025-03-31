
package com.example;

import java.sql.*;
import java.util.*;

/**
 * This class is a DAO (Data Access Object) - Use JDBC API
 * It encapsulates all the database operations for the EMP table
 */
public class EMPDAO {
    public EMP findEmployeeById(String eno) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String querySQL = "SELECT * FROM EMP WHERE ENO=?;";
        PreparedStatement pstmt = conn.prepareStatement(querySQL);
        pstmt.setString(1, eno);
        ResultSet rs = pstmt.executeQuery();

        EMP emp = null;

        if (rs.next()) {
            String ename = rs.getString("ENAME");
            String title = rs.getString("TITLE");
            // put the data from the resultset into an EMP Object
            emp = new EMP(eno, ename, title);
        }

        // close result set, statement and the connection to the database
        pstmt.close();
        rs.close();
        conn.close();

        return emp;
    }

    public int addNewEmployee(String eno, String ename, String title) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String insertSQL = "INSERT INTO EMP VALUES(?, ?, ?);";
        // System.out.println(insertSQL);
        PreparedStatement pstmt = conn.prepareStatement(insertSQL);
        pstmt.setString(1, eno);
        pstmt.setString(2, ename);
        pstmt.setString(3, title);
        int insertStatus = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        return insertStatus;
    }

    public int updateEmployee(String eno, String ename, String title) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String updateSQL = "UPDATE EMP SET ENAME=?, TITLE=? WHERE ENO=?;";
        // System.out.println(updateSQL);
        PreparedStatement pstmt = conn.prepareStatement(updateSQL);
        pstmt.setString(1, ename);
        pstmt.setString(2, title);
        pstmt.setString(3, eno);
        int updateStatus = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        return updateStatus;
    }

    public int deleteEmployee(String eno) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String deleteSQL = "DELETE FROM EMP WHERE ENO=?;";
        // System.out.println(deleteSQL);
        PreparedStatement pstmt = conn.prepareStatement(deleteSQL);
        pstmt.setString(1, eno);
        int deleteStatus = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        return deleteStatus;
    }

    public List<EMP> getAllEmployees() throws SQLException {
        String sql = "SELECT * FROM EMP";

        Connection conn = DBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        EMP emp;
        List<EMP> empList = new ArrayList<>();
        while (rs.next()) {
            String eno = rs.getString("ENO");
            String ename = rs.getString("ENAME");
            String title = rs.getString("TITLE");

            // put the data from the resultset into an EMP Object
            emp = new EMP(eno, ename, title);

            // add employee to the empList
            empList.add(emp);
        }

        // close all the db resources
        rs.close();
        stmt.close();
        conn.close();

        return empList;
    }
}
