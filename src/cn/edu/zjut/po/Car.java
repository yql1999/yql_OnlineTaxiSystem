package cn.edu.zjut.po;

public class Car {
	private int carID;
	private int seats;
	private String color;
	private String plate;
	private String type;
	private String location;
	
	public Car() {}
	
	public Car(int carID) {
		this.setCarID(carID);
	}
	
	public Car(int carID, int seats, String color, String plate, String type, String location) {
		this.setCarID(carID);
		this.setSeats(seats);
		this.setColor(color);
		this.setPlate(plate);
		this.setType(type);
		this.setLocation(location);
	}

	public int getCarID() {
		return carID;
	}

	public void setCarID(int carID) {
		this.carID = carID;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPlate() {
		return plate;
	}

	public void setPlate(String plate) {
		this.plate = plate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
