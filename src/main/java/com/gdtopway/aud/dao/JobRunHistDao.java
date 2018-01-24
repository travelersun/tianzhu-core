package com.gdtopway.aud.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.aud.entity.JobRunHist;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface JobRunHistDao extends BaseDao<JobRunHist, String> {

}