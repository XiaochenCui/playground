package com.rmi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * This class is a DAO (Data Access Object) - Use JDBC API It encapsulates all
 * the database operations for the EMP table
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

    public int addNewEmployee(String eno, String ename, String title, int sleepSeconds) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String insertSQL = "INSERT INTO EMP VALUES(?, ?, ?);";
        int insertStatus = 0;

        try {
            conn.setAutoCommit(false); // disable auto commit
            // System.out.println(insertSQL);
            PreparedStatement pstmt = conn.prepareStatement(insertSQL);
            pstmt.setString(1, eno);
            pstmt.setString(2, ename);
            pstmt.setString(3, title);
            insertStatus = pstmt.executeUpdate();

            // Simulate a long-running transaction
            System.out.println("[add api] Sleeping for " + sleepSeconds + " seconds...");
            try {
                Thread.sleep(sleepSeconds * 1000); // sleep for the specified seconds
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            pstmt.close();
            conn.commit(); // manual commit
        } catch (SQLException se) {
            // If there is any error.
            conn.rollback(); // rollback transaction
        }

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

    public List<EMP> getAllEmployees(int sleepSeconds) throws SQLException {
        String sql = "SELECT * FROM EMP";

        Connection conn = DBConnection.getConnection();
        List<EMP> empList = new ArrayList<>();

        try {
            conn.setAutoCommit(false); // disable auto commit
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            EMP emp;
            while (rs.next()) {
                String eno = rs.getString("ENO");
                String ename = rs.getString("ENAME");
                String title = rs.getString("TITLE");

                // put the data from the resultset into an EMP Object
                emp = new EMP(eno, ename, title);

                // add employee to the empList
                empList.add(emp);
            }

            // Simulate a long-running transaction
            System.out.println("[list api] Sleeping for " + sleepSeconds + " seconds...");
            try {
                Thread.sleep(sleepSeconds * 1000); // sleep for the specified seconds
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // close all the db resources
            rs.close();
            stmt.close();
            conn.commit();
        } catch (SQLException se) {
            // If there is any error.
            conn.rollback(); // rollback transaction
        }

        return empList;
    }
}
