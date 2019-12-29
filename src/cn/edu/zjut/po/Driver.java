package cn.edu.zjut.po;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

public class Driver {
	private int driverID;
	private String name;
	private boolean gender;
	private int age;
	private String idnumber;
	private String license;
	private int experience;
	private String account;
	private String password;
	private Car car;
	private String telephone;
	private Double score;
	private Double longitude;
	private Double latitude;
	
	public Driver() {}
	
	public Driver(int driverID) {
		this.setDriverID(driverID);
	}
	
	public Driver(int driverID, String name, boolean gender, int age, String idnumber, String license, int experience, String account, String password, Car car,String telephone,Double score,Double longitude,Double latitude) {
		this.setDriverID(driverID);
		this.setName(name);
		this.setGender(gender);
		this.setAge(age);
		this.setIdnumber(idnumber);
		this.setLicense(license);
		this.setExperience(experience);
		this.setAccount(account);
		this.setPassword(password);
		this.setCar(car);
		this.setTelephone(telephone);
		this.setScore(score);
		this.setLongitude(longitude);
		this.setLatitude(latitude);
		//this.setCarID(carID);
	}

	public int getDriverID() {
		return driverID;
	}

	public void setDriverID(int driverID) {
		this.driverID = driverID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@JSON(serialize=false)
	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	
}
