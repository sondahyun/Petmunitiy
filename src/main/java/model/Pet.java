package model;

import java.util.Date;

public class Pet {
	private int petId;
	private String name;
	
	private String gender;
	private int age;
	private String health;
	private String vaccination;
	private String kind;
	private String filename;	//파일 경로
		
	public Pet(int petId, String name, String gender, int age, String health, String vaccination, String kind,
			String filename) {
		super();
		this.petId = petId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.health = health;
		this.vaccination = vaccination;
		this.kind = kind;
		this.filename = filename;
	}
	
	public int getPetId() {
		return petId;
	}
	public void setPetId(int petId) {
		this.petId = petId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	public String getVaccination() {
		return vaccination;
	}
	public void setVaccination(String vaccination) {
		this.vaccination = vaccination;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "Pet [petId=" + petId + ", name=" + name + ", gender=" + gender + ", age=" + age + ", health="
				+ health + ", vaccination=" + vaccination + ", kind=" + kind + ", filename=" + filename + "]";
	}
	
	
}
