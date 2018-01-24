package com.gdtopway.module.sys.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.sys.entity.DataDict;

@Repository
public interface DataDictDao extends BaseDao<DataDict, String> {

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    @Query("from DataDict where primaryKey=:primaryKey and parent is null")
    public DataDict findByRootPrimaryKey(@Param("primaryKey") String primaryKey);

    @Query("from DataDict where parent.id=:parentId and disabled=false order by orderRank desc")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public List<DataDict> findEnabledChildrenByParentId(@Param("parentId") String parentId);

    @Query("from DataDict order by parent asc,orderRank desc")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public List<DataDict> findAllCached();
}