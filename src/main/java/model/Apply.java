package model;

import java.util.Date;

public class Apply implements Comparable {
	private int applyId;
	private String name;
	private int aType;
	private Date birth;
	private String phoneNumber;
	private String hopeConditions;
	private String allergy;
	private String address;
	private String housingType;
	private String resolution;
	private String etc;
	private int petId;
	
	public Apply() {
		super();
	}
	
	public Apply(int applyId, String name, int aType, Date birth, String phoneNumber, String hopeConditions,
			String allergy, String address, String housingType, String resolution, String etc, int petId) {
		super();
		this.applyId = applyId;
		this.name = name;
		this.aType = aType;
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.hopeConditions = hopeConditions;
		this.allergy = allergy;
		this.address = address;
		this.housingType = housingType;
		this.resolution = resolution;
		this.etc = etc;
		this.petId = petId;
	}

	public Apply(String name, int aType, Date birth, String phoneNumber, String hopeConditions, String allergy,
			String address, String housingType, String resolution, String etc, int petId) {
		super();
		this.name = name;
		this.aType = aType;
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.hopeConditions = hopeConditions;
		this.allergy = allergy;
		this.address = address;
		this.housingType = housingType;
		this.resolution = resolution;
		this.etc = etc;
		this.petId = petId;
	}

	public int getApplyId() {
		return applyId;
	}
	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getaType() {
		return aType;
	}
	public void setaType(int aType) {
		this.aType = aType;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getHopeConditions() {
		return hopeConditions;
	}
	public void setHopeConditions(String hopeConditions) {
		this.hopeConditions = hopeConditions;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHousingType() {
		return housingType;
	}
	public void setHousingType(String housingType) {
		this.housingType = housingType;
	}
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getPetId() {
		return petId;
	}
	public void setPetId(int petId) {
		this.petId = petId;
	}

	@Override
	public String toString() {
		return "Apply [applyId=" + applyId + ", name=" + name + ", aType=" + aType + ", Birth=" + birth
				+ ", phoneNumber=" + phoneNumber + ", hopeConditions=" + hopeConditions + ", allergy=" + allergy
				+ ", address=" + address + ", housingType=" + housingType + ", resolution=" + resolution + ", etc="
				+ etc + ", petId=" + petId + "]";
	}

	@Override
	public int compareTo(Object o) {
		Apply apply = (Apply) o;
		if(this.applyId < apply.applyId)
			return 1;
		else return -1;
	}	
	
}