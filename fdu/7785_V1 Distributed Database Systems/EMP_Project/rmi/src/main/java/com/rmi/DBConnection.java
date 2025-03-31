package com.rmi;

/**
 * Provides the Connection to the database
 */
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException {
        File dbFile = new File("../CSCI7785_database.db");
        System.out.println("Absolute Path: " + dbFile.getAbsolutePath());
        System.out.println("Exists: " + dbFile.exists());

        // Change the path the database (.db) file on your machine...
        // Just by changing the URL you point to another database
        String dbURL = "jdbc:sqlite:../CSCI7785_database.db";
        Connection conn = DriverManager.getConnection(dbURL);
        return conn;
    }
}
