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

    public int addNewEmployee(String eno, String ename, String title) {
        try {
            return empDAO.addNewEmployee(eno, ename, title);
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

    public List<EMP> getAllEmployees() {
        try {
            List<EMP> empList = empDAO.getAllEmployees();
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

            // Bind the remote object's stub in the registry
            Registry registry = LocateRegistry.getRegistry();
            registry.bind("EMP", stub);

            System.err.println("Server ready");

            Thread.currentThread().join();
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
        }
    }
}
