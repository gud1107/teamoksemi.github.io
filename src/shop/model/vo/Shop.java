package shop.model.vo;

import java.sql.Date;

public class Shop implements java.io.Serializable{
	private static final long serialVersionUID = 3526284197511410119L;
	private String shopCode; // 쇼핑몰코드
	private String shopGradeCode; // 쇼핑몰등급코드
	private String shopName; // 쇼핑몰이름
	private Date contractDate; // 계약일
	private Date expireDate; // 계약만료일
	private int contractMoney; // 계약금액
	private String shopPIC; // 담당자
	private String shopContact; // 쇼핑몰연락처
	private String status; // 쇼핑몰삭제여부
	
	public Shop() {}

	public Shop(String shopCode, String shopGradeCode, String shopName, Date contractDate, Date expireDate,
			int contractMoney, String shopPIC, String shopContact, String status) {
		super();
		this.shopCode = shopCode;
		this.shopGradeCode = shopGradeCode;
		this.shopName = shopName;
		this.contractDate = contractDate;
		this.expireDate = expireDate;
		this.contractMoney = contractMoney;
		this.shopPIC = shopPIC;
		this.shopContact = shopContact;
		this.status = status;
	}

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getShopGradeCode() {
		return shopGradeCode;
	}

	public void setShopGradeCode(String shopGradeCode) {
		this.shopGradeCode = shopGradeCode;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

	public int getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(int contractMoney) {
		this.contractMoney = contractMoney;
	}

	public String getShopPIC() {
		return shopPIC;
	}

	public void setShopPIC(String shopPIC) {
		this.shopPIC = shopPIC;
	}

	public String getShopContact() {
		return shopContact;
	}

	public void setShopContact(String shopContact) {
		this.shopContact = shopContact;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Shop [shopCode=" + shopCode + ", shopGradeCode=" + shopGradeCode + ", shopName=" + shopName
				+ ", contractDate=" + contractDate + ", expireDate=" + expireDate + ", contractMoney=" + contractMoney
				+ ", shopPIC=" + shopPIC + ", shopContact=" + shopContact + ", status=" + status + "]";
	}

	

	
	
	
}
