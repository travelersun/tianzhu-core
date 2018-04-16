package com.tianzhu.module.schedule.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.schedule.entity.JobBeanCfg;

@Repository
public interface JobBeanCfgDao extends BaseDao<JobBeanCfg, String> {

    @Query("from JobBeanCfg")
    List<JobBeanCfg> findAll();

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    JobBeanCfg findByJobClass(String jobClass);
}