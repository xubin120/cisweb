package com.simon.cis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.PlanItemVO;
import com.simon.cis.vo.PlanVO;

public class PlanDao extends SqlSessionDaoSupport {

    private static Logger logger = Logger.getLogger(PlanDao.class);

    public int insertPlan(PlanVO planVO) {
        SqlSession sql = getSqlSession();
        return sql.insert("com.simon.cis.vo.PlanMapper.insertPlan", planVO);
    }
    
    public int insertPlanItems(List<PlanItemVO> planItemList) {
        SqlSession sql = getSqlSession();
        return sql.insert("com.simon.cis.vo.PlanMapper.insertPlanItems", planItemList);
    }

    public List<PlanVO> findAllPlan(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.PlanMapper.findAllPlan", null, rb);
    }

    public PlanVO findById(int planId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.PlanMapper.findById", planId);
    }

    public int updatePlan(PlanVO planVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.PlanMapper.updatePlan", planVO);
    }

    public int deleteOnePlanById(int planId) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.PlanMapper.deleteOnePlan", planId);
    }
    
    public int deletePlanItemByPlanId(int planId) {
        SqlSession sql = getSqlSession();
        return sql.delete("com.simon.cis.vo.PlanMapper.deletePlanItem", planId);
    }
}
