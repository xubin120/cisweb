package com.simon.cis.vo;

/**
 * 
 * @author simon
 * @date 2015年1月3日
 */
public class ItemVO {
    private int id;
    private String name;
    private String price;
    private String description;
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
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
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
        sb.append("\n price="+this.getPrice());
        sb.append("\n description="+this.getDescription());
        sb.append("\n isDelete="+this.getIsDelete());
        
        return sb.toString();
    }
}
