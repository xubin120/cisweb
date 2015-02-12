package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.ActivityVO;

public class ActivityDao extends SqlSessionDaoSupport {

    private static Logger logger = Logger.getLogger(ActivityDao.class);

    public int insertActivity(ActivityVO activityVO) {
        SqlSession sql = getSqlSession();
        return sql.insert("com.simon.cis.vo.ActivityMapper.insertActivity", activityVO);
    }

    public List<ActivityVO> findAllActivity(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.ActivityMapper.findAllActivity", null, rb);
    }

    public ActivityVO findById(int activityId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.ActivityMapper.findById", activityId);
    }

    public int updateActivity(ActivityVO activityVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ActivityMapper.updateActivity", activityVO);
    }

    public int deleteOneActivityById(int activityId) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ActivityMapper.deleteOneActivity", activityId);
    }
}
