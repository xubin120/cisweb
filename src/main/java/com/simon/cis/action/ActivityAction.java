package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.ActivityDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.vo.ActivityVO;


/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class ActivityAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private ActivityVO activityVO;
    private List<ActivityVO> activityList;
    private PageInfo pi;
    private int currentPage = 1;
    private String activityId;

    @Autowired
    private ActivityDao activityDao;

    public String preAdd() {
        return SUCCESS;
    }

    public String add() throws Exception {

        activityVO.setIsDelete('N');
        int i = activityDao.insertActivity(activityVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String preEdit() {
        activityVO = activityDao.findById(Integer.valueOf(activityId).intValue());
        return SUCCESS;
    }
    
    public String edit() throws Exception{
        int i = activityDao.updateActivity(activityVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String delete() {
        int i = activityDao.deleteOneActivityById(Integer.valueOf(activityId).intValue());
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    @Override
    public String execute() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        HttpServletRequest request = ServletActionContext.getRequest();
        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.valueOf(request.getParameter("currentPage")).intValue();  
        }
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        activityList = activityDao.findAllActivity(rb);
        if (activityList != null) {
            pi = new PageInfo(activityList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public ActivityVO getActivityVO() {
        return activityVO;
    }

    public void setActivityVO(ActivityVO activityVO) {
        this.activityVO = activityVO;
    }

    public List<ActivityVO> getActivityList() {
        return activityList;
    }

    public void setActivityList(List<ActivityVO> activityList) {
        this.activityList = activityList;
    }

    public PageInfo getPi() {
        return pi;
    }

    public void setPi(PageInfo pi) {
        this.pi = pi;
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }
}
