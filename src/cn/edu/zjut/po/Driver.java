package cn.edu.zjut.po;

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
	//private int carID;
	private Car car;
	
	public Driver() {}
	
	public Driver(int driverID) {
		this.setDriverID(driverID);
	}
	
	public Driver(int driverID, String name, boolean gender, int age, String idnumber, String license, int experience, String account, String password, Car car) {
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

	public boolean isGender() {
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

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

//	public int getCarID() {
//		return carID;
//	}
//
//	public void setCarID(int carID) {
//		this.carID = carID;
//	}
}
