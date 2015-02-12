package com.simon.cis.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.ItemDao;
import com.simon.cis.dao.PlanDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.ItemVO;
import com.simon.cis.vo.PlanItemVO;
import com.simon.cis.vo.PlanVO;

/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class PlanAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private PlanVO planVO;
    private List<PlanVO> planList;
    private List<ItemVO> itemList;
    private PageInfo pi;
    private int currentPage = 1;
    private String planId;
    private String itemIds;

    private String planItemIds;

    @Autowired
    private PlanDao planDao;

    @Autowired
    private ItemDao itemDao;

    public String preAdd() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        itemList = itemDao.findAllItem(rb);
        if (itemList != null) {
            pi = new PageInfo(itemList);
        }
        return SUCCESS;
    }

    public String add() throws Exception {

        planVO.setIsDelete('N');
        int i = planDao.insertPlan(planVO);

        List<PlanItemVO> planItemList = new ArrayList<PlanItemVO>();
        String[] itemIdArr = StringUtil.stringToArray(itemIds);

        for (String itemId : itemIdArr) {
            PlanItemVO planItemVO = new PlanItemVO();
            planItemVO.setPlanId(planVO.getId());
            planItemVO.setItemId(Integer.valueOf(itemId.trim()).intValue());
            planItemList.add(planItemVO);
        }

        int j = planDao.insertPlanItems(planItemList);
        if (i > 0 && j > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String preEdit() throws Exception {
        planVO = planDao.findById(Integer.valueOf(planId).intValue());

        List<PlanItemVO> planItemList = planVO.getPlanItemList();
        if (!planItemList.isEmpty()) {
            StringBuffer sb = new StringBuffer();
            for (PlanItemVO planItemVO : planItemList) {
                sb.append(planItemVO.getItemId() + ",");
            }
            planItemIds = sb.toString();
            planItemIds = planItemIds.substring(0, planItemIds.length() - 1);
        }

        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        itemList = itemDao.findAllItem(rb);
        if (itemList != null) {
            pi = new PageInfo(itemList);
        }
        return SUCCESS;
    }

    public String edit() throws Exception {

        String[] itemIdsArr = itemIds.split(",");
        List<PlanItemVO> insertPlanItemList = new ArrayList<PlanItemVO>();

        for (String itemId : itemIdsArr) {
            PlanItemVO insertPlanItemVO = new PlanItemVO();
            insertPlanItemVO.setItemId(Integer.valueOf(itemId.trim()).intValue());
            insertPlanItemVO.setPlanId(planVO.getId());

            insertPlanItemList.add(insertPlanItemVO);
        }
        int delete = planDao.deletePlanItemByPlanId(planVO.getId());
        int insert = planDao.insertPlanItems(insertPlanItemList);
        int i = planDao.updatePlan(planVO);
        if (delete > 0 && insert > 0 && i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String delete() {
        int i = planDao.deleteOnePlanById(Integer.valueOf(planId).intValue());
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
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.valueOf(request.getParameter("currentPage")).intValue();
        }
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        planList = planDao.findAllPlan(rb);
        if (planList != null) {
            pi = new PageInfo(planList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public PlanVO getPlanVO() {
        return planVO;
    }

    public void setPlanVO(PlanVO planVO) {
        this.planVO = planVO;
    }

    public List<PlanVO> getPlanList() {
        return planList;
    }

    public void setPlanList(List<PlanVO> planList) {
        this.planList = planList;
    }

    public List<ItemVO> getItemList() {
        return itemList;
    }

    public void setItemList(List<ItemVO> itemList) {
        this.itemList = itemList;
    }

    public PageInfo getPi() {
        return pi;
    }

    public void setPi(PageInfo pi) {
        this.pi = pi;
    }

    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public String getItemIds() {
        return itemIds;
    }

    public void setItemIds(String itemIds) {
        this.itemIds = itemIds;
    }

    public String getPlanItemIds() {
        return planItemIds;
    }

    public void setPlanItemIds(String planItemIds) {
        this.planItemIds = planItemIds;
    }
}
