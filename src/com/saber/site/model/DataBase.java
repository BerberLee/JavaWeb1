package com.saber.site.model;

import com.sun.org.apache.regexp.internal.RESyntaxException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DataBase {
    private Connection connection;

    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void openConnection() throws SQLException {
        this.connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                "hr", "AdminSaber66");
        connection.setAutoCommit(false);
    }

    public void closeConnection() throws SQLException {
        if (this.connection != null) {
            this.connection.close();
        }
    }

    public List<Employee> getEmployees(int minEmployeeId, int maxEmployeeId) throws SQLException {
        List<Employee> employees = new ArrayList<>();
        PreparedStatement preparedStatement = this.connection.prepareStatement("SELECT * FROM HR.EMPLOYEES  WHERE EMPLOYEE_ID BETWEEN ? AND ?");
        preparedStatement.setInt(1, minEmployeeId);
        preparedStatement.setInt(2, maxEmployeeId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Employee employee = new Employee();
            employee.setEmployeeId(resultSet.getInt("employee_id"));
            employee.setFirstName(resultSet.getString("first_name"));
            employee.setLastName(resultSet.getString("last_name"));
            employee.setEmail(resultSet.getString("email"));
            employee.setSalary(resultSet.getLong("salary"));
            employee.setPhoneNumber(resultSet.getString("phone_number"));
            employee.setHireDate(resultSet.getDate("hire_date"));
            employees.add(employee);
        }

        return employees;
    }
    public int countEmployees() throws SQLException {
        PreparedStatement preparedStatement = this.connection.prepareStatement("SELECT COUNT(*) as counter FROM  HR.EMPLOYEES");
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        return resultSet.getInt("counter");
    }
}
