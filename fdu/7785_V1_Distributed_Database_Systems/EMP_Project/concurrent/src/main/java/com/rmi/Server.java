package com.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

public class Server implements RemoteEMP {

    static EMPDAO empDAO = new EMPDAO();

    public Server() {
    }

    public EMP findEmployeeById(String eno) {
        try {
            EMP emp = empDAO.findEmployeeById(eno);
            return emp;
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            return null;
        }
    }

    public int addNewEmployee(String eno, String ename, String title, int sleepSeconds) {
        try {
            return empDAO.addNewEmployee(eno, ename, title, sleepSeconds);
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            return -1;
        }
    }

    public int updateEmployee(String eno, String ename, String title) {
        try {
            return empDAO.updateEmployee(eno, ename, title);
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            return -1;
        }
    }

    public int deleteEmployee(String eno) {
        try {
            return empDAO.deleteEmployee(eno);
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            return -1;
        }
    }

    public List<EMP> getAllEmployees(int sleepSeconds) {
        try {
            List<EMP> empList = empDAO.getAllEmployees(sleepSeconds);
            return empList;
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String args[]) {

        try {
            Server obj = new Server();
            RemoteEMP stub = (RemoteEMP) UnicastRemoteObject.exportObject(obj, 0);

            Registry registry = LocateRegistry.getRegistry();

            // Unbind the remote object's stub in the registry
            try {
                registry.unbind("EMP");
            } catch (Exception e) {
                // Ignore the exception if the object is not already bound
                System.err.println("No existing binding found for EMP: " + e.toString());
            }

            // Bind the remote object's stub in the registry
            registry.bind("EMP", stub);

            System.err.println("Server ready");

            Thread.currentThread().join();
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
        }
    }
}
