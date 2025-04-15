package com.rmi;

import java.io.Serializable;

/**
 * A Plain Old Jave Object (POJO) representing one employee record in the
 * database
 * 
 * Update:
 * - Added Serializable interface to allow object serialization.
 */
public class EMP implements Serializable {

    private String eno;
    private String ename;
    private String title;

    public EMP(String no, String name, String title) {
        this.eno = no;
        this.ename = name;
        this.title = title;
    }

    public String getENO() {
        return eno;
    }

    public String getName() {
        return ename;
    }

    public String getTitle() {
        return title;
    }

    public String toString() {
        return eno + " " + ename + " " + title + " ";
    }
}
