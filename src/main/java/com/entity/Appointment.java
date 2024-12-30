package com.entity;

public class Appointment {
	
	
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int id;
	private int userId;
	private String fullname;
	private String gender;
	private String age;
	private String appointDate;
	private String email;
	private String phno;
	private String diesease;
	private int doctorId;
	private String address;
	private String status;
	public Appointment(int userId, String fullname, String gender, String age, String appointDate, String email,
			String phno, String diesease, int doctorId, String address, String status) {
		super();
		this.userId = userId;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.appointDate = appointDate;
		this.email = email;
		this.phno = phno;
		this.diesease = diesease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(String appointDate) {
		this.appointDate = appointDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getDiesease() {
		return diesease;
	}
	public void setDiesease(String diesease) {
		this.diesease = diesease;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
