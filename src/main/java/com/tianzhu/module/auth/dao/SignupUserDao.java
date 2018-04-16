package com.tianzhu.module.auth.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.SignupUser;

@Repository
public interface SignupUserDao extends BaseDao<SignupUser, String> {
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    SignupUser findByAuthUid(String authUid);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<SignupUser> findByEmail(String email);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<SignupUser> findByMobile(String mobile);
}