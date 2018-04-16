package com.tianzhu.module.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.User;
import com.tianzhu.module.sys.entity.UserProfileData;

@Repository
public interface UserProfileDataDao extends BaseDao<UserProfileData, String> {

    UserProfileData findByUserAndCode(User user, String code);

    List<UserProfileData> findByUser(User user);
}