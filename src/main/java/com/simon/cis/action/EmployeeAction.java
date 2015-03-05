package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.EmployeeDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.EmployeeVO;


/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class EmployeeAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private EmployeeVO employeeVO;
    private List<EmployeeVO> employeeList;
    private PageInfo pi;
    private int currentPage = 1;
    private String employeeId;
    private String keyword;

    @Autowired
    private EmployeeDao employeeDao;

    public String preAdd() {
        return SUCCESS;
    }

    public String add() throws Exception {

        if (StringUtil.isEmpty(employeeVO.getDepartureDate())) {
            employeeVO.setDepartureDate(null);
        }
        int i = employeeDao.insertEmployee(employeeVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String preEdit() {
        employeeVO = employeeDao.findById(Integer.valueOf(employeeId).intValue());
        return SUCCESS;
    }
    
    public String edit() throws Exception{
        
        if (StringUtil.isEmpty(employeeVO.getDepartureDate())) {
            employeeVO.setDepartureDate(null);
        }
        int i = employeeDao.updateEmployee(employeeVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String delete() {
        int i = employeeDao.deleteOneEmployeeById(Integer.valueOf(employeeId).intValue());
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String findByKeyword() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        HttpServletRequest request = ServletActionContext.getRequest();
        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.valueOf(request.getParameter("currentPage")).intValue();  
        }
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        employeeList = employeeDao.findByKeyword(keyword, rb);
        if (employeeList != null) {
            pi = new PageInfo(employeeList);
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
        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.valueOf(request.getParameter("currentPage")).intValue();  
        }
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        employeeList = employeeDao.findAllEmployee(rb);
        if (employeeList != null) {
            pi = new PageInfo(employeeList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public EmployeeVO getEmployeeVO() {
        return employeeVO;
    }

    public void setEmployeeVO(EmployeeVO employeeVO) {
        this.employeeVO = employeeVO;
    }

    public List<EmployeeVO> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<EmployeeVO> employeeList) {
        this.employeeList = employeeList;
    }

    public PageInfo getPi() {
        return pi;
    }

    public void setPi(PageInfo pi) {
        this.pi = pi;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
