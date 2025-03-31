package com.rmi;

import java.util.List;
import java.util.Scanner;
import java.sql.SQLException;

/**
 * This is the app main class
 * It uses the EMPDAO class to get the data from the database
 * 
 */
public class EmpDBConsoleApp {
    static Scanner scanner = new Scanner(System.in);
    static EMPDAO empDAO = new EMPDAO();
    // ANSI escape code constants for text colors
    static final String RESET = "\u001B[0m";
    static final String GREEN = "\u001B[32m";
    static final String RED = "\u001B[31m";

    // Application main
    public static void main(String[] args) throws SQLException {
        String choice = "";
        while (!choice.equals("6")) {
            System.out.println("""

                    Employee Database System
                    =================================================================
                    1. Show All Employees
                    2. Find an employee by ID
                    3. Add a new employee
                    4. Delete an employee
                    5. Update an employee
                    6. Exit
                    =================================================================
                    Enter your choice: """);
            choice = scanner.nextLine();
            switch (choice) {
                case "1" -> showAllEmployees();
                case "2" -> findEmployeeByNo();
                case "3" -> addNewEmployee();
                case "4" -> deleteEmployee();
                case "5" -> updateEmployee();
                case "6" -> System.exit(0);
                default -> System.out.println("Enter a choice between 1 and 6");
            }
        }
    }

    public static void showAllEmployees() throws SQLException {
        // get all employees using the DAO
        List<EMP> empList = empDAO.getAllEmployees();

        // iterate over the empList and print
        for (EMP emp : empList) {
            System.out.println(GREEN + emp + RESET);
        }
    }

    public static void findEmployeeByNo() throws SQLException {
        System.out.println("Enter employee No. to find:");
        String eno = scanner.nextLine();

        EMP emp = empDAO.findEmployeeById(eno);
        if (emp != null) {
            System.out.println(GREEN + emp + RESET);
        } else {
            System.out.println(RED + "No employee with No.: " + eno + RESET);
        }
    }

    public static void addNewEmployee() throws SQLException {
        System.out.println("Enter new employee No.:");
        String eno = scanner.nextLine();

        System.out.println("Enter new employee name:");
        String ename = scanner.nextLine();

        System.out.println("Enter new employee title:");
        String title = scanner.nextLine();

        int addStatus = empDAO.addNewEmployee(eno, ename, title);
        if (addStatus == 1) {
            System.out.println(GREEN + eno + " " + ename + " Added successfully" + RESET);
        } else {
            System.out.println(RED + "Error adding new employee " + eno + " " + ename + RESET);
        }
    }

    public static void deleteEmployee() throws SQLException {
        System.out.println("Enter employee No. to delete:");
        String eno = scanner.nextLine();

        if (empDAO.findEmployeeById(eno) == null) {
            System.out.println(RED + "No employee with No.: " + eno + RESET);
            return;
        }

        int delStatus = empDAO.deleteEmployee(eno);
        if (delStatus == 1) {
            System.out.println(GREEN + eno + " deleted successfully" + RESET);
        } else {
            System.out.println(RED + "Error deleting employee " + eno + RESET);
        }
    }

    public static void updateEmployee() throws SQLException {
        System.out.println("Enter employee No. to update:");
        String eno = scanner.nextLine();

        if (empDAO.findEmployeeById(eno) == null) {
            System.out.println(RED + "No employee with No.: " + eno + RESET);
            return;
        }

        System.out.println("Enter new employee name:");
        String ename = scanner.nextLine();

        System.out.println("Enter new employee title:");
        String title = scanner.nextLine();

        int updateStatus = empDAO.updateEmployee(eno, ename, title);

        if (updateStatus == 1) {
            System.out.println(GREEN + eno + " " + ename + " updated successfully" + RESET);
        } else {
            System.out.println(RED + "Error updating " + eno + " " + ename + RESET);
        }
    }

}
