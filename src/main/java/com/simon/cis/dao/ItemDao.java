package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.ItemVO;

public class ItemDao extends SqlSessionDaoSupport {

    private static Logger logger = Logger.getLogger(ItemDao.class);

    public int insertItem(ItemVO itemVO) {
        SqlSession sql = getSqlSession();
        return sql.insert("com.simon.cis.vo.ItemMapper.insertItem", itemVO);
    }

    public List<ItemVO> findAllItem(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.ItemMapper.findAllItem", null, rb);
    }

    public ItemVO findById(int itemId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.ItemMapper.findById", itemId);
    }

    public int updateItem(ItemVO itemVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ItemMapper.updateItem", itemVO);
    }

    public int deleteOneItemById(int itemId) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ItemMapper.deleteOneItem", itemId);
    }
}
