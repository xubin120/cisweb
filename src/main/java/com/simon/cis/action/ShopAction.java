package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.ActivityDao;
import com.simon.cis.dao.CustomerDao;
import com.simon.cis.dao.EmployeeDao;
import com.simon.cis.dao.ItemDao;
import com.simon.cis.dao.PlanDao;
import com.simon.cis.dao.ShopDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.DateUtil;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.vo.ActivityVO;
import com.simon.cis.vo.CustomerVO;
import com.simon.cis.vo.EmployeeVO;
import com.simon.cis.vo.ItemVO;
import com.simon.cis.vo.PlanVO;
import com.simon.cis.vo.ShopVO;

/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class ShopAction extends ActionSupport {

    private static final long serialVersionUID = -656764640302594636L;

    private ShopVO shopVO;
    private List<ShopVO> shopList;
    private List<CustomerVO> customerList;
    private List<EmployeeVO> employeeList;
    private List<ActivityVO> activityList;
    private List<PlanVO> planList;
    private List<ItemVO> itemList;
    private int currentPage = 1;
    private String shopId;
    private PageInfo<?> pi;
    private PageInfo<?> cpi;
    private PageInfo<?> epi;
    private PageInfo<?> api;
    private PageInfo<?> ppi;
    private PageInfo<?> ipi;
    
    private String customerName;
    private String employeeName;
    private String activityName;
    private String planName;
    private String itemName;

    @Autowired
    private ShopDao shopDao;
    
    @Autowired
    private CustomerDao customerDao;
    
    @Autowired
    private EmployeeDao employeeDao;
    
    @Autowired
    private ActivityDao activityDao;
    
    @Autowired
    private PlanDao planDao;
    
    @Autowired
    private ItemDao itemDao;

    public String preAdd() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        //客户
        customerList = customerDao.findAllCustomer(rb);
        if (customerList != null) {
            cpi = new PageInfo(customerList);
        }
        //美容师
        employeeList = employeeDao.findAllEmployee(rb);
        if (employeeList != null) {
            epi = new PageInfo(employeeList);
        }
        //活动
        activityList = activityDao.findAllActivity(rb);
        if (activityList != null) {
            api = new PageInfo(activityList);
        }
        //方案
        planList = planDao.findAllPlan(rb);
        if (planList != null) {
            ppi = new PageInfo(planList);
        }
        //项目
        itemList = itemDao.findAllItem(rb);
        if (itemList != null) {
            ipi = new PageInfo(itemList);
        }
        return SUCCESS;
    }

    public String add() throws Exception {
        
        int i = shopDao.insertShop(shopVO);

        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String preEdit() throws Exception {
        shopVO = shopDao.findById(Integer.valueOf(shopId).intValue());
        
        shopVO.setArrivalTime(DateUtil.getDateString("yyyy-MM-dd HH:mm", shopVO.getArrivalTime()));
        
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        //客户
        customerList = customerDao.findAllCustomer(rb);
        if (customerList != null) {
            cpi = new PageInfo(customerList);
        }
        
        CustomerVO customerVO = customerDao.findById(shopVO.getCustomerId());
        this.setCustomerName(customerVO.getName());
        
        //美容师
        employeeList = employeeDao.findAllEmployee(rb);
        if (employeeList != null) {
            epi = new PageInfo(employeeList);
        }
        
        EmployeeVO employeeVO = employeeDao.findById(shopVO.getEmployeeId());
        this.setEmployeeName(employeeVO.getName());
        
        //活动
        activityList = activityDao.findAllActivity(rb);
        if (activityList != null) {
            api = new PageInfo(activityList);
        }
        
        ActivityVO activityVO = activityDao.findById(shopVO.getActivityId());
        this.setActivityName(activityVO.getName());
        
        //方案
        planList = planDao.findAllPlan(rb);
        if (planList != null) {
            ppi = new PageInfo(planList);
        }
        
        PlanVO planVO = planDao.findById(shopVO.getPlanId());
        this.setPlanName(planVO.getName());
        
        //项目
        itemList = itemDao.findAllItem(rb);
        if (itemList != null) {
            ipi = new PageInfo(itemList);
        }
        
        ItemVO itemVO = itemDao.findById(shopVO.getItemId());
        this.setItemName(itemVO.getName());
        
        return SUCCESS;
    }

    public String edit() throws Exception {
        
        int i = shopDao.updateShop(shopVO);

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
        shopList = shopDao.findAllShop(rb);
        if (shopList != null) {
            
            for (ShopVO shop : shopList) {
                shop.setArrivalTime(DateUtil.getDateString("yyyy-MM-dd HH:mm", shop.getArrivalTime()));
            }
            
            pi = new PageInfo(shopList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public PageInfo<?> getPi() {
        return pi;
    }

    public void setPi(PageInfo<?> pi) {
        this.pi = pi;
    }

    public PageInfo<?> getCpi() {
        return cpi;
    }

    public void setCpi(PageInfo<?> cpi) {
        this.cpi = cpi;
    }

    public PageInfo<?> getEpi() {
        return epi;
    }

    public void setEpi(PageInfo<?> epi) {
        this.epi = epi;
    }

    public PageInfo<?> getApi() {
        return api;
    }

    public void setApi(PageInfo<?> api) {
        this.api = api;
    }

    public PageInfo<?> getPpi() {
        return ppi;
    }

    public void setPpi(PageInfo<?> ppi) {
        this.ppi = ppi;
    }

    public PageInfo<?> getIpi() {
        return ipi;
    }

    public void setIpi(PageInfo<?> ipi) {
        this.ipi = ipi;
    }

    public ShopVO getShopVO() {
        return shopVO;
    }

    public void setShopVO(ShopVO shopVO) {
        this.shopVO = shopVO;
    }

    public List<ShopVO> getShopList() {
        return shopList;
    }

    public void setShopList(List<ShopVO> shopList) {
        this.shopList = shopList;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public List<CustomerVO> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<CustomerVO> customerList) {
        this.customerList = customerList;
    }

    public List<EmployeeVO> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<EmployeeVO> employeeList) {
        this.employeeList = employeeList;
    }

    public List<ActivityVO> getActivityList() {
        return activityList;
    }

    public void setActivityList(List<ActivityVO> activityList) {
        this.activityList = activityList;
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

}
