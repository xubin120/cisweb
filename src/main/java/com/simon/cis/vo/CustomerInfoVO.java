/*
 * Copyright (c) 2013, FPX and/or its affiliates. All rights reserved.
 * Use, Copy is subject to authorized license.
 */
package com.simon.cis.vo;

/**
 * 
 * @author simon
 * @date 2014年12月31日
 */
public class CustomerInfoVO {
    private int id;
    private int customerId;
    private String childrenSex;
    private String childrenAge;
    private String spouseProfession;
    private String couples;
    private String disposition;
    private String hobby;
    private String praise;
    private String homeAssets;
    private String consumerAwareness;
    private String maintenanceAwareness;
    private String cosmetology;
    private String family;
    private String facial;
    private String body;
    private String requirement;
    private String beauticianRequest;
    private String trust;
    private String trustReason;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    public String getChildrenSex() {
        return childrenSex;
    }
    public void setChildrenSex(String childrenSex) {
        this.childrenSex = childrenSex;
    }
    public String getChildrenAge() {
        return childrenAge;
    }
    public void setChildrenAge(String childrenAge) {
        this.childrenAge = childrenAge;
    }
    public String getSpouseProfession() {
        return spouseProfession;
    }
    public void setSpouseProfession(String spouseProfession) {
        this.spouseProfession = spouseProfession;
    }
    public String getCouples() {
        return couples;
    }
    public void setCouples(String couples) {
        this.couples = couples;
    }
    public String getDisposition() {
        return disposition;
    }
    public void setDisposition(String disposition) {
        this.disposition = disposition;
    }
    public String getHobby() {
        return hobby;
    }
    public void setHobby(String hobby) {
        this.hobby = hobby;
    }
    public String getPraise() {
        return praise;
    }
    public void setPraise(String praise) {
        this.praise = praise;
    }
    public String getHomeAssets() {
        return homeAssets;
    }
    public void setHomeAssets(String homeAssets) {
        this.homeAssets = homeAssets;
    }
    public String getConsumerAwareness() {
        return consumerAwareness;
    }
    public void setConsumerAwareness(String consumerAwareness) {
        this.consumerAwareness = consumerAwareness;
    }
    public String getMaintenanceAwareness() {
        return maintenanceAwareness;
    }
    public void setMaintenanceAwareness(String maintenanceAwareness) {
        this.maintenanceAwareness = maintenanceAwareness;
    }
    public String getCosmetology() {
        return cosmetology;
    }
    public void setCosmetology(String cosmetology) {
        this.cosmetology = cosmetology;
    }
    public String getFamily() {
        return family;
    }
    public void setFamily(String family) {
        this.family = family;
    }
    public String getFacial() {
        return facial;
    }
    public void setFacial(String facial) {
        this.facial = facial;
    }
    public String getBody() {
        return body;
    }
    public void setBody(String body) {
        this.body = body;
    }
    public String getRequirement() {
        return requirement;
    }
    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }
    public String getBeauticianRequest() {
        return beauticianRequest;
    }
    public void setBeauticianRequest(String beauticianRequest) {
        this.beauticianRequest = beauticianRequest;
    }
    public String getTrust() {
        return trust;
    }
    public void setTrust(String trust) {
        this.trust = trust;
    }
    public String getTrustReason() {
        return trustReason;
    }
    public void setTrustReason(String trustReason) {
        this.trustReason = trustReason;
    }
    
    public String toString() {
        
        StringBuffer sb = new StringBuffer();
        sb.append(" customerId=" + this.getCustomerId());
        sb.append("\n childrenSex=" + this.getChildrenSex());
        sb.append("\n childrenAge=" + this.getChildrenAge());
        sb.append("\n spouseProfession=" + this.getSpouseProfession());
        sb.append("\n couples=" + this.getCouples());
        sb.append("\n disposition=" + this.getDisposition());
        sb.append("\n hobby=" + this.getHobby());
        sb.append("\n praise=" + this.getPraise());
        sb.append("\n homeAssets=" + this.getHomeAssets());
        sb.append("\n consumerAwareness=" + this.getConsumerAwareness());
        sb.append("\n maintenanceAwareness=" + this.getMaintenanceAwareness());
        sb.append("\n cosmetology=" + this.getCosmetology());
        sb.append("\n family=" + this.getFamily());
        sb.append("\n facial=" + this.getFacial());
        sb.append("\n body=" + this.getBody());
        sb.append("\n requirement=" + this.getRequirement());
        sb.append("\n beauicianRequest=" + this.getBeauticianRequest());
        sb.append("\n trust=" + this.getTrust());
        sb.append("\n trustReason=" + this.getTrustReason());

        return sb.toString();
    }
}
