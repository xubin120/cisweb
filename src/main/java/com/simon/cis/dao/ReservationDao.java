package com.simon.cis.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.simon.cis.vo.ReservationVO;

public class ReservationDao extends SqlSessionDaoSupport {
    
    private static Logger logger = Logger.getLogger(ReservationDao.class);
    
    public int insertReservation(ReservationVO ReservationVO) {
        SqlSession sql = getSqlSession();        
        return sql.insert("com.simon.cis.vo.ReservationMapper.insertReservation",ReservationVO);
    }
    
    public List<ReservationVO> findAllReservation(RowBounds rb) {
        SqlSession sql = getSqlSession();
        return sql.selectList("com.simon.cis.vo.ReservationMapper.findAllReservation", null, rb);
    }
    
    public ReservationVO findById(int ReservationId) {
        SqlSession sql = getSqlSession();
        return sql.selectOne("com.simon.cis.vo.ReservationMapper.findById", ReservationId);
    }
    
    public int updateReservation(ReservationVO ReservationVO) {
        SqlSession sql = getSqlSession();
        return sql.update("com.simon.cis.vo.ReservationMapper.updateReservation",ReservationVO);
    }
}
