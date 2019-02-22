package TNT_Bean;

import java.sql.Date;

public class StaffBean {
	private String staff_id;
	private String staff_pass;
	private String staff_name;
	private String staff_gender;
	private String staff_responsibility;
	private int staff_salary;
	private String staff_address;
	private String staff_phone;
	private String staff_email;
	private Date staff_birth;

	public String getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}

	public String getStaff_pass() {
		return staff_pass;
	}

	public void setStaff_pass(String staff_pass) {
		this.staff_pass = staff_pass;
	}

	public String getStaff_name() {
		return staff_name;
	}

	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}

	public String getStaff_gender() {
		return staff_gender;
	}

	public void setStaff_gender(String staff_gender) {
		this.staff_gender = staff_gender;
	}

	public String getStaff_responsibility() {
		return staff_responsibility;
	}

	public void setStaff_responsibility(String staff_responsibility) {
		this.staff_responsibility = staff_responsibility;
	}

	public int getStaff_salary() {
		return staff_salary;
	}

	public void setStaff_salary(int staff_salary) {
		this.staff_salary = staff_salary;
	}

	public String getStaff_address() {
		return staff_address;
	}

	public void setStaff_address(String staff_address) {
		this.staff_address = staff_address;
	}

	public String getStaff_phone() {
		return staff_phone;
	}

	public void setStaff_phone(String staff_phone) {
		this.staff_phone = staff_phone;
	}

	public String getStaff_email() {
		return staff_email;
	}

	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}

	public Date getStaff_birth() {
		return staff_birth;
	}

	public void setStaff_birth(Date staff_birth) {
		this.staff_birth = staff_birth;
	}

	@Override
	public String toString() {
		return "StaffBean [staff_id=" + staff_id + ", staff_pass=" + staff_pass + ", staff_name=" + staff_name
				+ ", staff_gender=" + staff_gender + ", staff_responsibility=" + staff_responsibility
				+ ", staff_salary=" + staff_salary + ", staff_address=" + staff_address + ", staff_phone=" + staff_phone
				+ ", staff_email=" + staff_email + ", staff_birth=" + staff_birth + "]";
	}

	

}