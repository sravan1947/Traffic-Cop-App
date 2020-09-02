package com.register.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.register.datamodel.policemen;
import hash.password;

public class copDao {
	 public int registercop(policemen cop) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO cop" +
	            "  (first_name, last_name, username, password, address, contact) VALUES " +
	            " (?, ?, ?, ?,?,?);";

	        int result = 0;

	        Class.forName("com.mysql.cj.jdbc.Driver");  

	        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/policcops?useSSL=false", "root", "sravan");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	            String st=cop.getPassword();
	            password p=new password();
	           st= password.hashPassword(st);
	            preparedStatement.setString(1, cop.getFirstname());
	            preparedStatement.setString(2, cop.getLastname());
	            preparedStatement.setString(3, cop.getUsername());
	            preparedStatement.setString(4,st);
	            preparedStatement.setString(5, cop.getAddress());
	            preparedStatement.setString(6, cop.getContact());

	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return result;
	    }
	 private void printSQLException(SQLException ex) {
	        for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
}
