package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.doctor;
import com.mysql.cj.protocol.Resultset;


public class doctorDao {

	private Connection conn;

	public doctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addDoctor(doctor D) {
		boolean f=false;
		try {
			String sql="insert into doctor(fullname,dob,qualification,specialist,email,mobno,password) values (?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, D.getFullname());
			ps.setString(2, D.getDob());
			ps.setString(3, D.getQualification());
			ps.setString(4, D.getSpecialist());
			ps.setString(5, D.getEmail());
			ps.setString(6, D.getMobno());
			ps.setString(7, D.getPassword());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				return f;
	}
	public List<doctor> getdoctor(){
		List<doctor> list=new ArrayList<doctor>();
		doctor s=null;
		try {
			
			String sql="select * from doctor order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				s=new doctor(sql, sql, sql, sql, sql, sql, sql);
				s.setId(rs.getInt(1));
				s.setFullname(rs.getString(2));
				s.setDob(rs.getString(3));
				
				s.setQualification(rs.getString(4));
				s.setSpecialist(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setMobno(rs.getString(7));
				s.setPassword(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	
	
	public  doctor getdoctorByid(int id){
		
		doctor s=null;
		try {
			
			String sql="select * from doctor where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				s=new doctor(sql, sql, sql, sql, sql, sql, sql);
				s.setId(rs.getInt(1));
				s.setFullname(rs.getString(2));
				s.setDob(rs.getString(3));
				
				s.setQualification(rs.getString(4));
				s.setSpecialist(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setMobno(rs.getString(7));
				s.setPassword(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return s;
	}
	
	
	public boolean updatedoctor(doctor D) {
		boolean f=false;
		try {
			String sql="update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobno=?,password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, D.getFullname());
			ps.setString(2, D.getDob());
			ps.setString(3, D.getQualification());
			ps.setString(4, D.getSpecialist());
			ps.setString(5, D.getEmail());
			ps.setString(6, D.getMobno());
			ps.setString(7, D.getPassword());
			ps.setInt(8, D.getId());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				return f;
	}
	
	
	public boolean deleteDoctor(int id) {
		boolean f=false;
		try {
			String sql="delete from doctor where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			int i=ps.executeUpdate();
			ps.setInt(1, id);
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public doctor doctorlogin(String email,String psw) {
		doctor s=null;
		try {
			String sql="select * from doctor where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new doctor(0, sql, sql, sql, sql, email, sql, psw);
				s.setId(rs.getInt(1));
				s.setFullname(rs.getString(2));
				s.setDob(rs.getString(3));
				
				s.setQualification(rs.getString(4));
				s.setSpecialist(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setMobno(rs.getString(7));
				s.setPassword(rs.getString(8));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return s;
	}
	
	public int countdoctor() {
		int i=0;
		
		try {
			String sql="select * from doctor";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countappointment() {
		int i=0;
		
		try {
			String sql="select * from appointment";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countUser() {
		int i=0;
		
		try {
			String sql="select * from user_details";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countSpecialist() {
		int i=0;
		
		try {
			String sql="select * from specialist";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countappointmentdoctorByid(int id) {
		int i=0;
		
		try {
			String sql="select * from appointment where doctorId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	public boolean changeoldPassword(int uid,String Password) {
		boolean f=false;
		try {
			String sql="select * from doctor where id=? and password=?";
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
			String sql="update  doctor set password=? where id=?";
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
	
	
	public boolean EditdoctorProfile(doctor D) {
		boolean f=false;
		try {
			String sql="update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobno=?where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, D.getFullname());
			ps.setString(2, D.getDob());
			ps.setString(3, D.getQualification());
			ps.setString(4, D.getSpecialist());
			ps.setString(5, D.getEmail());
			ps.setString(6, D.getMobno());
			
			ps.setInt(7, D.getId());
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
