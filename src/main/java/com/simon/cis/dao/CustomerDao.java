package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.CustomerInfoVO;
import com.simon.cis.vo.CustomerVO;

public class CustomerDao extends SqlSessionDaoSupport {
    
    private static Logger logger = Logger.getLogger(CustomerDao.class);
    
    public int insertCustomer(CustomerVO customerVO) {
        SqlSession sql = getSqlSession();        
        return sql.insert("com.simon.cis.vo.CustomerMapper.insertCustomer",customerVO);
    }
    
    public List<CustomerVO> findAllCustomer(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.CustomerMapper.findAllCustomer", null, rb);
    }
    
    public CustomerVO findById(int customerId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.CustomerMapper.findById", customerId);
    }
    
    public int updateCustomer(CustomerVO customerVO) {
        SqlSession sql = getSqlSession();
//        int val = 0;
//        int i = sql.update("com.simon.cis.vo.CustomerMapper.updateCustomer",customerVO);
//        int j = updateCustomerInfo(customerVO.getCustomerInfo());
//        
//        if (i > 0 && j > 0) {
//            val = 1;
//        } 
//        return val;
        
        return sql.update("com.simon.cis.vo.CustomerMapper.updateCustomer",customerVO);
    }
    
    public int updateCustomerInfo(CustomerInfoVO customerInfoVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.CustomerMapper.updateCustomerInfo",customerInfoVO);
    }
    
    public int insertCustomerInfo(CustomerInfoVO customerInfoVO) {
        SqlSession sql = getSqlSession();
        return sql.insert("com.simon.cis.vo.CustomerMapper.insertCustomerInfo",customerInfoVO);
    }
    
    public int deleteOneCustomerById(int customerId) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.CustomerMapper.deleteOneCustomer", customerId);
    }
    
    public List<CustomerVO> findByKeyword(String keyword, RowBounds rb){
        SqlSession sql = getSqlSession();
        if(StringUtil.isEmpty(keyword)){
            keyword = null;
        }
        return sql.selectList("com.simon.cis.vo.CustomerMapper.findByKeyword", keyword, rb);
    }
}
