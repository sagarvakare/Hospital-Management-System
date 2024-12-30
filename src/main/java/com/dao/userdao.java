package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userdao {

	private Connection conn;

	public userdao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean register(User u) {
		boolean f=false;
		
		try {
			
			String sql=("insert into user_details(name,email,password) values(?,?,?)");
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return f;
	}
	
	public User login(String em,String psw) {
		User u=null;
		try {
			String sql=("select *from user_details where email=? and password=?");
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public boolean changeoldPassword(int uid,String Password) {
		boolean f=false;
		try {
			String sql="select * from user_details where id=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, Password);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changenewPassword(int uid,String newpas) {
		boolean f=false;
		try {
			String sql="update  user_details set password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, newpas);
			ps.setInt(2, uid);
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
