package com.simon.cis.vo;

/**
 * 
 * @author simon
 * @date 2015年1月3日
 */
public class ActivityVO {
    private int id;
    private String name;
    private String content;
    private String startDate;
    private String endDate;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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
        sb.append("\n content="+this.getContent());
        sb.append("\n startDate="+this.getStartDate());
        sb.append("\n endDate="+this.getEndDate());
        sb.append("\n isDelete="+this.getIsDelete());
        
        return sb.toString();
    }
}
