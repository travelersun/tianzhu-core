package com.gdtopway.module.schedule.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.schedule.entity.JobBeanCfg;

@Repository
public interface JobBeanCfgDao extends BaseDao<JobBeanCfg, Long> {

    @Query("from JobBeanCfg")
    List<JobBeanCfg> findAll();

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    JobBeanCfg findByJobClass(String jobClass);
}