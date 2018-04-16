package com.tianzhu.biz.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.biz.shop.dao.SiteUserDao;
import com.tianzhu.biz.shop.entity.SiteUser;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.module.auth.entity.User;
import com.tianzhu.module.auth.service.UserService;

@Service
@Transactional
public class SiteUserService extends BaseService<SiteUser, String> {

    @Autowired
    private SiteUserDao siteUserDao;

    @Autowired
    private UserService userService;

    @Override
    protected BaseDao<SiteUser, String> getEntityDao() {
        return siteUserDao;
    }

    public SiteUser findByUser(User user) {
        return siteUserDao.findByUser(user);
    }
}
