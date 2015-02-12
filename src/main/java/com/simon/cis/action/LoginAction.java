package com.simon.cis.action;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;

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

    private String username;
    private String password;
    private LoginVO loginVO;
    
    private String json;

    @Autowired
    private LoginDao loginDao;
    
    public String toMainPage() {
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("用户名："+loginVO.getUsername());
        System.out.println("密码："+loginVO.getPwd());
        
        LoginVO resultVO = loginDao.queryLoginInfo(loginVO);
        
        if (resultVO != null) {
//            ObjectMapper mapper = new ObjectMapper();  
//            String jsonStr = mapper.writeValueAsString(map);
//            
//            PrintWriter out = response.getWriter();
//            out.println(jsonStr);
//            out.flush();
            return SUCCESS;
        } else {
            return INPUT;
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LoginVO getLoginVO() {
        return loginVO;
    }

    public void setLoginVO(LoginVO loginVO) {
        this.loginVO = loginVO;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
