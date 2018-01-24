package com.gdtopway.module.sys.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.sys.entity.ConfigProperty;

@Repository
public interface ConfigPropertyDao extends BaseDao<ConfigProperty, String> {

    @Query("from ConfigProperty")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<ConfigProperty> findAllCached();

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    ConfigProperty findByPropKey(String propKey);
}