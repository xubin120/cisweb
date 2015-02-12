package com.simon.cis.vo;


/**
 * 
 * @author simon
 * @date 2015年1月3日
 */
public class ReservationVO {
    private int id;
    private String date;
    private String customerId;
    private String shopTime;
    private String antiShopTime;
    private String antiShopRemindTime;
    private String mark;
    
    private CustomerVO customerVO;
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getShopTime() {
        return shopTime;
    }

    public void setShopTime(String shopTime) {
        this.shopTime = shopTime;
    }

    public String getAntiShopTime() {
        return antiShopTime;
    }

    public void setAntiShopTime(String antiShopTime) {
        this.antiShopTime = antiShopTime;
    }

    public String getAntiShopRemindTime() {
        return antiShopRemindTime;
    }

    public void setAntiShopRemindTime(String antiShopRemindTime) {
        this.antiShopRemindTime = antiShopRemindTime;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public CustomerVO getCustomerVO() {
        return customerVO;
    }

    public void setCustomerVO(CustomerVO customerVO) {
        this.customerVO = customerVO;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(" id="+this.getId());
        sb.append("\n date="+this.getDate());
        sb.append("\n shopTime="+this.getShopTime());
        sb.append("\n antiShopTime="+this.getAntiShopTime());
        sb.append("\n antiShopRemindTime="+this.getAntiShopRemindTime());
        
        return sb.toString();
    }
}
