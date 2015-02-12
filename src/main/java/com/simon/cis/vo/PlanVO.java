package com.simon.cis.vo;

import java.util.List;

/**
 * 
 * @author simon
 * @date 2015年1月3日
 */
public class PlanVO {
    private int id;
    private String name;
    private String price;
    private char isDelete;
    
    private List<PlanItemVO> planItemList;
    
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

    public char getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(char isDelete) {
        this.isDelete = isDelete;
    }

    public List<PlanItemVO> getPlanItemList() {
        return planItemList;
    }

    public void setPlanItemList(List<PlanItemVO> planItemList) {
        this.planItemList = planItemList;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(" id="+this.getId());
        sb.append("\n name="+this.getName());
        sb.append("\n price="+this.getPrice());
        sb.append("\n isDelete="+this.getIsDelete());
        
        return sb.toString();
    }
}
