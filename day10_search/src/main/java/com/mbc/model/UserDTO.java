package com.mbc.model;

public class UserDTO {
	private int uno;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String email;
	private String tel;
	
	public UserDTO() {}

	// 인자 생성자
	public UserDTO(int uno, String id, String pw, String name, int age, String email, String tel) {
		super();
		this.uno = uno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.email = email;
		this.tel = tel;
	}
	
	public UserDTO(String id, String pw, String name, int age, String email, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.email = email;
		this.tel = tel;
	}

	public int getUno() {
		return uno;
	}


	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}



	@Override
	public String toString() {
		return "UserDTO [uno=" + uno + ", id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", email="
				+ email + ", tel=" + tel + "]";
	}
	
	
	
}
