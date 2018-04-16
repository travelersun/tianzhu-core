package com.tianzhu.aud.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.aud.entity.JobRunHist;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface JobRunHistDao extends BaseDao<JobRunHist, String> {

}