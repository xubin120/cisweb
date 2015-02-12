package com.simon.cis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.ItemDao;
import com.simon.cis.page.PageInfo;
import com.simon.cis.util.PropertiesUtil;
import com.simon.cis.vo.ItemVO;


/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class ItemAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private ItemVO itemVO;
    private List<ItemVO> itemList;
    @SuppressWarnings("rawtypes")
    private PageInfo pi;
    private int currentPage = 1;
    private String itemId;

    @Autowired
    private ItemDao itemDao;

    public String preAdd() {
        return SUCCESS;
    }

    public String add() throws Exception {

        itemVO.setIsDelete('N');
        int i = itemDao.insertItem(itemVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String preEdit() {
        itemVO = itemDao.findById(Integer.valueOf(itemId).intValue());
        return SUCCESS;
    }
    
    public String edit() throws Exception{
        int i = itemDao.updateItem(itemVO);
        if (i > 0) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
    
    public String delete() {
        int i = itemDao.deleteOneItemById(Integer.valueOf(itemId).intValue());
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
        itemList = itemDao.findAllItem(rb);
        if (itemList != null) {
            pi = new PageInfo(itemList);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public ItemVO getItemVO() {
        return itemVO;
    }

    public void setItemVO(ItemVO itemVO) {
        this.itemVO = itemVO;
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

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
}
