package com.fine.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.fine.datamodel.finemodel;

public class fineDao {
	 public int finedperson(finemodel p) throws ClassNotFoundException {
	        String INSERT_USERS_SQL = "INSERT INTO fine" +
	            "(violation_name, violation_type, driving_license, vehicle_details, date_and_time , fine_amount, location, vehicle_number,email) VALUES " +
	            " (?,?,?,?,?,?,?,?,?);";
	        int result = 0;
	        Class.forName("com.mysql.cj.jdbc.Driver");  

	        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/policcops?useSSL=false", "root", "sravan");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
	            preparedStatement.setString(1, p.getVoilation_name());
	            preparedStatement.setString(2, p.getVoilation_type());
	            preparedStatement.setString(3, p.getDriving_license());
	            preparedStatement.setString(4,p.getVehicle_details());
	            preparedStatement.setString(5,p.getData_and_time());
	            preparedStatement.setString(6, p.getFine_amount());
	            preparedStatement.setString(7, p.getLocation());
	            preparedStatement.setString(8, p.getVechicle_number());
	            preparedStatement.setString(9,p.getEmail());
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
