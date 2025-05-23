package com.rmi;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.List;

/**
 * This is the app main class It uses the EMPDAO class to get the data from the
 * database
 *
 */
public class ConcurrentClient {

    static RemoteEMP empDAO;

    // ANSI escape code constants for text colors
    static final String RESET = "\u001B[0m";
    static final String GREEN = "\u001B[32m";
    static final String RED = "\u001B[31m";

    // Application main
    public static void main(String[] args) throws RemoteException {
        String host = (args.length < 1) ? null : args[0];
        try {
            // init registry and lookup the remote object
            Registry registry = LocateRegistry.getRegistry(host);
            empDAO = (RemoteEMP) registry.lookup("EMP");
        } catch (Exception e) {
            System.err.println("Client exception: " + e.toString());
            e.printStackTrace();
        }

        // Create a thread for showAllEmployees
        Thread showAllEmployeesThread = new Thread(() -> {
            try {
                showAllEmployees();
            } catch (RemoteException e) {
                System.err.println("Error in showAllEmployees thread: " + e.toString());
                e.printStackTrace();
            }
        });

        // Create a thread for addNewEmployee
        Thread addNewEmployeeThread = new Thread(() -> {
            try {
                addNewEmployee();
            } catch (RemoteException e) {
                System.err.println("Error in addNewEmployee thread: " + e.toString());
                e.printStackTrace();
            }
        });

        // Start both threads
        showAllEmployeesThread.start();
        addNewEmployeeThread.start();

        // Wait for both threads to finish
        try {
            showAllEmployeesThread.join();
            addNewEmployeeThread.join();
        } catch (Exception e) {
        }
    }

    public static void showAllEmployees() throws RemoteException {
        // get all employees using the DAO
        List<EMP> empList = empDAO.getAllEmployees();

        // iterate over the empList and print
        for (EMP emp : empList) {
            System.out.println(GREEN + emp + RESET);
        }
    }

    public static void addNewEmployee() throws RemoteException {
        String eno = "E123";
        String ename = "Trump";
        String title = "President";
        int addStatus = empDAO.addNewEmployee(eno, ename, title);
        if (addStatus == 1) {
            System.out.println(GREEN + eno + " " + ename + " Added successfully" + RESET);
        } else {
            System.out.println(RED + "Error adding new employee " + eno + " " + ename + RESET);
        }
    }
}
