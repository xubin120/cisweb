package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.util.StringUtil;
import com.simon.cis.vo.EmployeeVO;

public class EmployeeDao extends SqlSessionDaoSupport {
    
    private static Logger logger = Logger.getLogger(EmployeeDao.class);
    
    public int insertEmployee(EmployeeVO employeeVO) {
        SqlSession sql = getSqlSession();        
        return sql.insert("com.simon.cis.vo.EmployeeMapper.insertEmployee",employeeVO);
    }
    
    public List<EmployeeVO> findAllEmployee(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.EmployeeMapper.findAllEmployee", null, rb);
    }
    
    public EmployeeVO findById(int employeeId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.EmployeeMapper.findById", employeeId);
    }
    
    public int updateEmployee(EmployeeVO employeeVO) {
        SqlSession sql = getSqlSession();        
        return sql.update("com.simon.cis.vo.EmployeeMapper.updateEmployee",employeeVO);
    }
    
    public int deleteOneEmployeeById(int employeeId) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.EmployeeMapper.deleteOneEmployee", employeeId);
    }
    
    public List<EmployeeVO> findByKeyword(String keyword, RowBounds rb){
        SqlSession sql = getSqlSession();
        if(StringUtil.isEmpty(keyword)){
            keyword = null;
        }
        return sql.selectList("com.simon.cis.vo.EmployeeMapper.findByKeyword", keyword, rb);
    }
}
