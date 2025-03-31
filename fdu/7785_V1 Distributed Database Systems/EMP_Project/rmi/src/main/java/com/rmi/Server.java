package com.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

public class Server implements RemoteEMP {

    static EMPDAO empDAO = new EMPDAO();

    public Server() {
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
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
        }
    }
}
