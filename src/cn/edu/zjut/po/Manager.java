package cn.edu.zjut.po;

public class Manager {
	private int managerID;
	private String account;
	private String password;
	
	public Manager() {}
	
	public Manager(int managerID) {
		this.setManagerID(managerID);
	}
	
	public Manager(int managerID, String account, String password) {
		this.setManagerID(managerID);
		this.setAccount(account);
		this.setPassword(password);
	}

	public int getManagerID() {
		return managerID;
	}

	public void setManagerID(int managerID) {
		this.managerID = managerID;
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
}
