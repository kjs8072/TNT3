package TNT_Bean;

import java.sql.Date;

public class StaffLicenseBean {

	private String f_license_code;
	private Date f_license_start_date;
	private Date f_license_end_date;
	private int license_num;
	private int staff_num;

	public String getF_license_code() {
		return f_license_code;
	}

	public void setF_license_code(String f_license_code) {
		this.f_license_code = f_license_code;
	}

	public Date getF_license_start_date() {
		return f_license_start_date;
	}

	public void setF_license_start_date(Date f_license_start_date) {
		this.f_license_start_date = f_license_start_date;
	}

	public Date getF_license_end_date() {
		return f_license_end_date;
	}

	public void setF_license_end_date(Date f_license_end_date) {
		this.f_license_end_date = f_license_end_date;
	}

	public int getLicense_num() {
		return license_num;
	}

	public void setLicense_num(int license_num) {
		this.license_num = license_num;
	}

	public int getStaff_num() {
		return staff_num;
	}

	public void setStaff_num(int staff_num) {
		this.staff_num = staff_num;
	}

}
