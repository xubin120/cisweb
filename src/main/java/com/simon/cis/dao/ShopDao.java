package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.ShopVO;

public class ShopDao extends SqlSessionDaoSupport {
    
    private static Logger logger = Logger.getLogger(ShopDao.class);
    
    public int insertShop(ShopVO shopVO) {
        SqlSession sql = getSqlSession();        
        return sql.insert("com.simon.cis.vo.ShopMapper.insertShop",shopVO);
    }
    
    public List<ShopVO> findAllShop(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.ShopMapper.findAllShop", null, rb);
    }
    
    public ShopVO findById(int shopId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.ShopMapper.findById", shopId);
    }
    
    public int updateShop(ShopVO shopVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ShopMapper.updateShop",shopVO);
    }
}
