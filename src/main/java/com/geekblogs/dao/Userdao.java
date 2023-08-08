package com.geekblogs.dao;
import java.sql.*;
import com.geekblogs.entities.User;


public class Userdao {
	
	private Connection con;

	public Userdao(Connection con) {
		this.con = con;
	}
	
	//method to insert users data to database
	
	public boolean saveuser(User user) {
		boolean f=false;
		try {
			
			//user-->database
			String query="insert into users(name, email, password, gender, occupation) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getOccupation());
			
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//get user by user_email and password
	public User getUserByEmailAndPassword(String email, String password) {
		
		User user=null;
		
		try {
			
			String query ="select *from users where email=? and password=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				
				user =new User();
				
				//getting data from database
				String name=set.getString("name");
				
				//setting to user object
				user.setName(name);
				
				user.setEmail(set.getString("email"));
				user.setId(set.getInt("id"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setOccupation(set.getString("occupation"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}
	
	//updating the user
	public boolean updateUser(User user) {
		 
		boolean flag=false;
		
		try {
			
			String query="update users set name=?, email=?, password=?, gender=?, occupation=?, profile=? where id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getOccupation());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());
			p.executeUpdate();
			flag=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
		return flag;
	}
	
	
}
