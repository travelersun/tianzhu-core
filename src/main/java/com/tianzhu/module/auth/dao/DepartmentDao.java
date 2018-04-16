package com.tianzhu.module.auth.dao;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.Department;

@Repository
public interface DepartmentDao extends BaseDao<Department, String> {

    @Query("from Department")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public Iterable<Department> findAllCached();

}
