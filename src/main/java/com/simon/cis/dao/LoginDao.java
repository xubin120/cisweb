package com.simon.cis.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.LoginVO;

public class LoginDao extends SqlSessionDaoSupport {
    
    public LoginVO queryLoginInfo(LoginVO loginVO) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.LoginMapper.queryLoginInfo", loginVO);
    }
}
