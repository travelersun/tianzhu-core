package com.gdtopway.biz.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.biz.shop.dao.SiteUserDao;
import com.gdtopway.biz.shop.entity.SiteUser;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.auth.service.UserService;

@Service
@Transactional
public class SiteUserService extends BaseService<SiteUser, Long> {

    @Autowired
    private SiteUserDao siteUserDao;

    @Autowired
    private UserService userService;

    @Override
    protected BaseDao<SiteUser, Long> getEntityDao() {
        return siteUserDao;
    }

    public SiteUser findByUser(User user) {
        return siteUserDao.findByUser(user);
    }
}
