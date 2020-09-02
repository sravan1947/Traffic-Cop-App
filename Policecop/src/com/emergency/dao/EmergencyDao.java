package com.emergency.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.emergency.model.emergency_model;


public class EmergencyDao {
	 public int emergencyperson(emergency_model p) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO emergency" +
	            "(location, voilationtype,affected,phone_no) VALUES " +
	            " (?,?,?,?);";
	        int result = 0;
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        System.out.println("lsdfsbdfksdjb");	
	        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/policcops?useSSL=false", "root", "sravan");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	            preparedStatement.setString(1, p.getLocation());
	            preparedStatement.setString(2,p.getVoilationtype());
	            preparedStatement.setString(3,p.getAffected());
	            preparedStatement.setString(4,p.getPhone_no());
	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();
	            System.out.println("came");

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
