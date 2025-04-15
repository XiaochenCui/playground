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

    static volatile int sleepSeconds = 0; // seconds to sleep for the transaction

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

        System.out.println("run sequential (write -> write_commit -> read -> read_commit)");
        sequential();
        System.out.println("run readFirst (read -> write -> read_commit -> write_commit)");
        readFirst();
        System.out.println("run writeFirst (write -> read -> write_commit -> read_commit)");
        writeFirst();
    }

    static Thread createReadThread() {
        Thread showAllEmployeesThread = new Thread(() -> {
            try {
                showAllEmployees(sleepSeconds);
            } catch (RemoteException e) {
                System.err.println("Error in showAllEmployees thread: " + e.toString());
                e.printStackTrace();
            }
        });
        return showAllEmployeesThread;
    }

    static Thread createWriteThread() {
        Thread addNewEmployeeThread = new Thread(() -> {
            try {
                addNewEmployee(sleepSeconds);
            } catch (RemoteException e) {
                System.err.println("Error in addNewEmployee thread: " + e.toString());
                e.printStackTrace();
            }
        });
        return addNewEmployeeThread;
    }

    public static void sequential() {
        Thread addNewEmployeeThread = createWriteThread();
        Thread showAllEmployeesThread = createReadThread();

        try {
            int delStatus = empDAO.deleteEmployee("E123");

            addNewEmployeeThread.start();
            addNewEmployeeThread.join();

            showAllEmployeesThread.start();
            showAllEmployeesThread.join();
        } catch (Exception e) {
            System.err.println("Error in sequential: " + e.toString());
        }
    }

    /**
     * Demonstrate:
     *
     * - The read action blocks the write action. (Due to isolation)
     *
     * - The read action doesn't see the write action. (Serializabl isolation
     * prevents dirty reads)
     */
    public static void readFirst() {
        Thread addNewEmployeeThread = createWriteThread();
        Thread showAllEmployeesThread = createReadThread();

        try {
            int delStatus = empDAO.deleteEmployee("E123");

            sleepSeconds = 5; // seconds to sleep for the transaction
            showAllEmployeesThread.start();

            Thread.sleep(1 * 1000); // sleep for the specified seconds

            sleepSeconds = 0; // seconds to sleep for the transaction
            addNewEmployeeThread.start();

            addNewEmployeeThread.join();
            showAllEmployeesThread.join();
        } catch (Exception e) {
            System.err.println("Error in readFirst: " + e.toString());
        }
    }

    public static void writeFirst() {
        Thread addNewEmployeeThread = createWriteThread();
        Thread showAllEmployeesThread = createReadThread();

        try {
            int delStatus = empDAO.deleteEmployee("E123");

            sleepSeconds = 5; // seconds to sleep for the transaction
            addNewEmployeeThread.start();

            Thread.sleep(1 * 1000); // sleep for the specified seconds

            sleepSeconds = 0; // seconds to sleep for the transaction
            showAllEmployeesThread.start();

            addNewEmployeeThread.join();
            showAllEmployeesThread.join();
        } catch (Exception e) {
            System.err.println("Error in writeFirst: " + e.toString());
        }
    }

    public static void showAllEmployees(int sleepSeconds) throws RemoteException {
        // get all employees using the DAO
        List<EMP> empList = empDAO.getAllEmployees(sleepSeconds);

        // iterate over the empList and print
        for (EMP emp : empList) {
            System.out.println(GREEN + emp + RESET);
        }
    }

    public static void addNewEmployee(int sleepSeconds) throws RemoteException {
        String eno = "E123";
        String ename = "Trump";
        String title = "President";
        int addStatus = empDAO.addNewEmployee(eno, ename, title, sleepSeconds);
        if (addStatus == 1) {
            System.out.println(GREEN + eno + " " + ename + " Added successfully" + RESET);
        } else {
            System.out.println(RED + "Error adding new employee " + eno + " " + ename + RESET);
        }
    }
}
