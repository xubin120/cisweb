package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.CustomerDao;
import com.simon.cis.dao.ReservationDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.DateUtil;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.CustomerVO;
import com.simon.cis.vo.ReservationVO;

/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class ReservationAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private ReservationVO reservationVO;
    private List<ReservationVO> reservationList;
    private List<CustomerVO> customerList;
    private PageInfo pi;
    private int currentPage = 1;
    private String reservationId;

    @Autowired
    private ReservationDao reservationDao;
    
    @Autowired
    private CustomerDao customerDao;

    public String preAdd() throws Exception {
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        customerList = customerDao.findAllCustomer(rb);
        if (customerList != null) {
            pi = new PageInfo(customerList);
        }
        return SUCCESS;
    }

    public String add() throws Exception {
        
        if (StringUtil.isEmpty(reservationVO.getShopTime())) {
            reservationVO.setShopTime(null);
        }
        
        if (StringUtil.isEmpty(reservationVO.getAntiShopTime())) {
            reservationVO.setAntiShopTime(null);
        }
        
        if (StringUtil.isEmpty(reservationVO.getAntiShopRemindTime())) {
            reservationVO.setAntiShopRemindTime(null);
        }
        int i = reservationDao.insertReservation(reservationVO);

        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String preEdit() throws Exception {
        reservationVO = reservationDao.findById(Integer.valueOf(reservationId).intValue());
        
        reservationVO.setShopTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservationVO.getShopTime()));
        reservationVO.setAntiShopTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservationVO.getAntiShopTime()));
        reservationVO.setAntiShopRemindTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservationVO.getAntiShopRemindTime()));
        
        String pageRecords = PropertiesUtil.getPropertyValue("pagerecords");
        RowBounds rb = new RowBounds(currentPage, Integer.valueOf(pageRecords).intValue());
        customerList = customerDao.findAllCustomer(rb);
        if (customerList != null) {
            pi = new PageInfo(customerList);
        }
        return SUCCESS;
    }

    public String edit() throws Exception {
        
        int i = reservationDao.updateReservation(reservationVO);

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
        reservationList = reservationDao.findAllReservation(rb);
        if (reservationList != null) {
            
            for (ReservationVO reservation : reservationList) {
                reservation.setShopTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservation.getShopTime()));
                reservation.setAntiShopTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservation.getAntiShopTime()));
                reservation.setAntiShopRemindTime(DateUtil.dealDateOrDateTime("yyyy-MM-dd HH:mm", reservation.getAntiShopRemindTime()));
            }
            
            pi = new PageInfo(reservationList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public PageInfo getPi() {
        return pi;
    }

    public void setPi(PageInfo pi) {
        this.pi = pi;
    }

    public ReservationVO getReservationVO() {
        return reservationVO;
    }

    public void setReservationVO(ReservationVO reservationVO) {
        this.reservationVO = reservationVO;
    }

    public List<ReservationVO> getReservationList() {
        return reservationList;
    }

    public void setReservationList(List<ReservationVO> reservationList) {
        this.reservationList = reservationList;
    }

    public List<CustomerVO> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<CustomerVO> customerList) {
        this.customerList = customerList;
    }

    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }

}
