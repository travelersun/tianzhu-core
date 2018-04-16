package com.tianzhu.module.auth.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.Role;
import com.tianzhu.module.auth.entity.User;

@Repository
public interface RoleDao extends BaseDao<Role, String> {
    @Query("from Role order by code asc")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<Role> findAllCached();

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    Role findByCode(String code);

    @Query("select distinct r from UserR2Role u2r,Role r " + "where u2r.role=r " + "and u2r.user=:user and r.disabled=false order by r.code asc")
    List<Role> findRolesForUser(@Param("user") User user);
}