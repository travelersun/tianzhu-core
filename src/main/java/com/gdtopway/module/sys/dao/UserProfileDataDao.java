package com.gdtopway.module.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.sys.entity.UserProfileData;

@Repository
public interface UserProfileDataDao extends BaseDao<UserProfileData, Long> {

    UserProfileData findByUserAndCode(User user, String code);

    List<UserProfileData> findByUser(User user);
}