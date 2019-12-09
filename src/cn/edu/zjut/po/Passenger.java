package cn.edu.zjut.po;

public class Passenger {
	private int passengerID;
	private String name;
	private String nickname;
	private boolean gender;
	private int age;
	private String idnumber;
	private String account;
	private String password;
	private double remain;
	
	public Passenger() {}
	
	public Passenger(int passengerID) {
		this.setPassengerID(passengerID);
	}
	
	public Passenger(int passengerID, String name, String nickname, boolean gender, int age, String idnumber, String account, String password, double remain) {
		this.setPassengerID(passengerID);
		this.setName(name);
		this.setNickname(nickname);
		this.setGender(gender);
		this.setAge(age);
		this.setIdnumber(idnumber);
		this.setAccount(account);
		this.setPassword(password);
		this.setRemain(remain);
	}

	public int getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(int passengerID) {
		this.passengerID = passengerID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
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

	public double getRemain() {
		return remain;
	}

	public void setRemain(double remain) {
		this.remain = remain;
	}
	
}
