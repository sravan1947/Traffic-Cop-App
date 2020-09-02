package com.login.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import hash.password;
public class LoginDao {
	static String sql;
	static final String url="jdbc:mysql://localhost:3306/policcops";
	static final String  username="root";
	static final String password="sravan";
	password ph = new password();
	public boolean check(String uname,String password1) throws ClassNotFoundException, SQLException
	{
			Class.forName("com.mysql.jdbc.Driver");    
			Connection con= DriverManager.getConnection(url,username,password);
			sql="select * from cop where username=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			ResultSet rs=st.executeQuery();
			//System.out.println(rs.next());
			if(rs.next())
			{
				//System.out.println(uname);
				if(hash.password.checkPassword(password1, rs.getString("password")))
					return true;
				
				return false;
			}
		return false;
	}
}