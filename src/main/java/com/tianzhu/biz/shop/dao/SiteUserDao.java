package com.tianzhu.biz.shop.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.biz.shop.entity.SiteUser;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.User;

@Repository
public interface SiteUserDao extends BaseDao<SiteUser, String> {

    SiteUser findByUser(User user);
}
