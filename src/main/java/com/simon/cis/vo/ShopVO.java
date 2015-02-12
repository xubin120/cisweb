package com.simon.cis.vo;


/**
 * 
 * @author simon
 * @date 2015年1月3日
 */
public class ShopVO {
    private int id;
    private String arrivalTime;
    private int customerId;
    private int employeeId;
    private int itemId;
    private String room;
    private int hours;
    private String content;
    private String response;
    private int activityId;
    private int planId;
    
    private CustomerVO customerVO;
    private EmployeeVO employeeVO;
    private ItemVO itemVO;
    private ActivityVO activityVO;
    private PlanVO planVO;
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public CustomerVO getCustomerVO() {
        return customerVO;
    }

    public void setCustomerVO(CustomerVO customerVO) {
        this.customerVO = customerVO;
    }

    public EmployeeVO getEmployeeVO() {
        return employeeVO;
    }

    public void setEmployeeVO(EmployeeVO employeeVO) {
        this.employeeVO = employeeVO;
    }

    public ItemVO getItemVO() {
        return itemVO;
    }

    public void setItemVO(ItemVO itemVO) {
        this.itemVO = itemVO;
    }

    public ActivityVO getActivityVO() {
        return activityVO;
    }

    public void setActivityVO(ActivityVO activityVO) {
        this.activityVO = activityVO;
    }

    public PlanVO getPlanVO() {
        return planVO;
    }

    public void setPlanVO(PlanVO planVO) {
        this.planVO = planVO;
    }
    
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append(" id="+this.getId());
        sb.append("\n arrivalTime="+this.getArrivalTime());
        sb.append("\n customerId="+this.getCustomerId());
        sb.append("\n employeeId="+this.getEmployeeId());
        sb.append("\n itemId="+this.getItemId());
        sb.append("\n room="+this.getRoom());
        sb.append("\n hours="+this.getHours());
        sb.append("\n content="+this.getContent());
        sb.append("\n response="+this.getResponse());
        sb.append("\n activityId="+this.getActivityId());
        sb.append("\n planId="+this.getPlanId());
        
        return sb.toString();
    }
}
