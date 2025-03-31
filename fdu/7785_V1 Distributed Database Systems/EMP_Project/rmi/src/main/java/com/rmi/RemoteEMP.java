package com.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RemoteEMP extends Remote {
    String sayHello() throws RemoteException;
}