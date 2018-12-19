package com.saber.site.dao;

import com.saber.site.model.DataBase;
import com.saber.site.model.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeDAO {
    public static List<Employee> getEmployees(int minEmployeeId, int maxEmployeeId) throws SQLException {
        DataBase dataBase = new DataBase();
        dataBase.openConnection();
        List<Employee> employees = dataBase.getEmployees(minEmployeeId, maxEmployeeId);
        dataBase.closeConnection();
        return employees;
    }
    public static int countEmployee() throws SQLException {
        DataBase dataBase = new DataBase();
        dataBase.openConnection();
        int countEmployees = dataBase.countEmployees();
        dataBase.closeConnection();
        return countEmployees;
    }
}
