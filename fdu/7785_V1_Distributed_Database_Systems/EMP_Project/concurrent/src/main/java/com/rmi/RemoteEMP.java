package com.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface RemoteEMP extends Remote {

    EMP findEmployeeById(String eno) throws RemoteException;

    int addNewEmployee(String eno, String ename, String title, int sleepSeconds) throws RemoteException;

    int updateEmployee(String eno, String ename, String title) throws RemoteException;

    int deleteEmployee(String eno) throws RemoteException;

    List<EMP> getAllEmployees(int sleepSeconds) throws RemoteException;
}
