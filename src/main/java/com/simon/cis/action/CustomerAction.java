package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.CustomerDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.CustomerVO;

/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class CustomerAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private CustomerVO customerVO;
    private List<CustomerVO> customerList;
    private PageInfo pi;
    private int currentPage = 1;
    private String customerId;
    private String keyword;

    @Autowired
    private CustomerDao customerDao;

    public String preAdd() {
        return SUCCESS;
    }

    public String add() throws Exception {
        int j = 0;
        
        if (StringUtil.isEmpty(customerVO.getAge())) {
            customerVO.setAge(null);
        }
        if (StringUtil.isEmpty(customerVO.getBirthday())) {
            customerVO.setBirthday(null);
        }
        if (StringUtil.isEmpty(customerVO.getMembershipDate())) {
            customerVO.setMembershipDate(null);
        }
        
        int i = customerDao.insertCustomer(customerVO);
        if (customerVO.getCustomerInfo().getCustomerId() == 0) {
            customerVO.getCustomerInfo().setCustomerId(customerVO.getId());
            j = customerDao.insertCustomerInfo(customerVO.getCustomerInfo());
        }
        if (i > 0 && j > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String preEdit() {
        customerVO = customerDao.findById(Integer.valueOf(customerId).intValue());
        return SUCCESS;
    }

    public String edit() throws Exception {
        int j = 0;
                
        if (StringUtil.isEmpty(customerVO.getAge())) {
            customerVO.setAge(null);
        }
        if (StringUtil.isEmpty(customerVO.getBirthday())) {
            customerVO.setBirthday(null);
        }
        if (StringUtil.isEmpty(customerVO.getMembershipDate())) {
            customerVO.setMembershipDate(null);
        }
        if (StringUtil.isEmpty(customerVO.getCustomerInfo().getChildrenAge())) {
            customerVO.getCustomerInfo().setChildrenAge(null);
        }

        int i = customerDao.updateCustomer(customerVO);
        j = customerDao.updateCustomerInfo(customerVO.getCustomerInfo());
        
        if (i > 0 && j > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String delete() {
        int i = customerDao.deleteOneCustomerById(Integer.valueOf(customerId).intValue());
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String findByKeyword() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        HttpServletRequest request = ServletActionContext.getRequest();
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.valueOf(request.getParameter("currentPage")).intValue();
        }
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        customerList = customerDao.findByKeyword(keyword, rb);
        if (customerList != null) {
            pi = new PageInfo(customerList);
            System.out.println(pi.toString());
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
        customerList = customerDao.findAllCustomer(rb);
        if (customerList != null) {
            pi = new PageInfo(customerList);
            // System.out.println(pi.toString());
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public CustomerVO getCustomerVO() {
        return customerVO;
    }

    public void setCustomerVO(CustomerVO customerVO) {
        this.customerVO = customerVO;
    }

    public List<CustomerVO> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<CustomerVO> customerList) {
        this.customerList = customerList;
    }

    public PageInfo getPi() {
        return pi;
    }

    public void setPi(PageInfo pi) {
        this.pi = pi;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
