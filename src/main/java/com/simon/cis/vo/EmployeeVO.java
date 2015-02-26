package com.simon.cis.vo;


public class EmployeeVO {
    private int id;
    private String name;
    private String birthday;
    private String sex;
    private String phone;
    private String number;
    private String qq;
    private String email;
    private String address;
    private String status;
    private String entryDate;
    private String departureDate;
    private char isDelete;
    
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
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }
    public String getQq() {
        return qq;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getEntryDate() {
        return entryDate;
    }
    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }
    public String getDepartureDate() {
        return departureDate;
    }
    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }
    
    public char getIsDelete() {
        return isDelete;
    }
    public void setIsDelete(char isDelete) {
        this.isDelete = isDelete;
    }
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(" id="+this.getId());
        sb.append("\n name="+this.getName());
        sb.append("\n age="+this.getBirthday());
        sb.append("\n sex="+this.getSex());
        sb.append("\n phone="+this.getPhone());
        sb.append("\n number="+this.getNumber());
        sb.append("\n qq="+this.getQq());
        sb.append("\n email="+this.getEmail());
        sb.append("\n address="+this.getAddress());
        sb.append("\n status="+this.getStatus());
        sb.append("\n entryDate="+this.getEntryDate());
        sb.append("\n departureDate="+this.getDepartureDate());
        sb.append("\n isDelete="+this.getIsDelete());
        
        return sb.toString();
    }
}
