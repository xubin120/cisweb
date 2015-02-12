package com.simon.cis.vo;

public class CustomerVO {
    private int id;
    private String name;
    private String age;
    private String sex;
    private String homeTown;
    private String phone;
    private String birthday;
    private String profession;
    private String bloodType;
    private String constellation;
    private String assets;
    private String membershipDate;
    private String customerType;
    private char isDelete;
    
    private CustomerInfoVO customerInfo;
    
    public CustomerVO() {
        customerInfo = new CustomerInfoVO();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHomeTown() {
        return homeTown;
    }

    public void setHomeTown(String homeTown) {
        this.homeTown = homeTown;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getConstellation() {
        return constellation;
    }

    public void setConstellation(String constellation) {
        this.constellation = constellation;
    }

    public String getAssets() {
        return assets;
    }

    public void setAssets(String assets) {
        this.assets = assets;
    }

    public String getMembershipDate() {
        return membershipDate;
    }

    public void setMembershipDate(String membershipDate) {
        this.membershipDate = membershipDate;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public char getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(char isDelete) {
        this.isDelete = isDelete;
    }

    public CustomerInfoVO getCustomerInfo() {
        return customerInfo;
    }

    public void setCustomerInfo(CustomerInfoVO customerInfo) {
        this.customerInfo = customerInfo;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(" id=" + this.getId());
        sb.append("\n name=" + this.getName());
        sb.append("\n age=" + this.getAge());
        sb.append("\n sex=" + this.getSex());
        sb.append("\n homeTown=" + this.getHomeTown());
        sb.append("\n phone=" + this.getPhone());
        sb.append("\n birthday=" + this.getBirthday());
        sb.append("\n profession=" + this.getProfession());
        sb.append("\n bloodType=" + this.getBloodType());
        sb.append("\n constellation=" + this.getConstellation());
        sb.append("\n assets=" + this.getAssets());
        sb.append("\n membershipDate=" + this.getMembershipDate());
        sb.append("\n customerType=" + this.getCustomerType());
        sb.append("\n isDelete=" + this.getIsDelete());

        return sb.toString();
    }
}
