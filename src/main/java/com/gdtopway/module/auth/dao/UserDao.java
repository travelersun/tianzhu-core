package com.gdtopway.module.auth.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.auth.entity.User.AuthTypeEnum;

@Repository
public interface UserDao extends BaseDao<User, String> {

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    User findByAuthTypeAndAuthUid(AuthTypeEnum authType, String authUid);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    User findByAuthTypeAndAccessToken(AuthTypeEnum authType, String accessToken);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    User findByAuthUid(String authUid);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<User> findByEmail(String email);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    List<User> findByMobile(String mobile);
}