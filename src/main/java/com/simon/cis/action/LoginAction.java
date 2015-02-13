package com.simon.cis.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.simon.cis.dao.LoginDao;
import com.simon.cis.vo.LoginVO;

/**
 * 
 * @author simon
 * @date 2014年12月20日
 */
public class LoginAction extends ActionSupport {
    /**
     * 
     */
    private static final long serialVersionUID = -656764640302594636L;

    private LoginVO loginVO;
    
    private String resultMsg;

    @Autowired
    private LoginDao loginDao;
    
    public String toMainPage() {
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        
        LoginVO resultVO = loginDao.queryLoginInfo(loginVO);
        
        if (resultVO != null) {
            //记录用户登录信息  
            Map<String, Object> attibutes = ActionContext.getContext().getSession();
            attibutes.put("username", resultVO.getUsername());  
            
            resultMsg = "success";
        } else {
            resultMsg = "error";
        }
        
        ServletActionContext.getResponse().getWriter().print(resultMsg); 
        return null;
    }
    
    public String logout() throws Exception {
        ActionContext.getContext().getSession().clear();
        ServletActionContext.getRequest().getSession().invalidate();
        return SUCCESS;
    }

    public LoginVO getLoginVO() {
        return loginVO;
    }

    public void setLoginVO(LoginVO loginVO) {
        this.loginVO = loginVO;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }
}
