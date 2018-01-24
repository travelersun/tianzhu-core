package com.gdtopway.module.auth.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.security.PasswordService;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.core.util.DateUtils;
import com.gdtopway.core.util.UidUtils;
import com.gdtopway.module.auth.dao.RoleDao;
import com.gdtopway.module.auth.dao.SignupUserDao;
import com.gdtopway.module.auth.dao.UserDao;
import com.gdtopway.module.auth.dao.UserExtDao;
import com.gdtopway.module.auth.entity.SignupUser;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.auth.entity.UserExt;
import com.gdtopway.module.auth.entity.UserR2Role;
import com.google.common.collect.Lists;

@Service
@Transactional
public class SignupUserService extends BaseService<SignupUser, String> {

    @Autowired
    private SignupUserDao signupUserDao;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserExtDao userExtDao;

    @Override
    protected BaseDao<SignupUser, String> getEntityDao() {
        return signupUserDao;
    }

    @Transactional(readOnly = true)
    public List<SignupUser> findByEmail(String email) {
        return signupUserDao.findByEmail(email);
    }

    @Transactional(readOnly = true)
    public List<SignupUser> findByMobile(String mobile) {
        return signupUserDao.findByMobile(mobile);
    }

    public SignupUser findByAuthUid(String authUid) {
        return signupUserDao.findByAuthUid(authUid);
    }

    public String encodeUserPasswd(SignupUser signupUser, String rawPassword) {
        return passwordService.entryptPassword(rawPassword, signupUser.getAuthGuid());
    }

    public SignupUser signup(SignupUser entity, String rawPassword) {
        entity.setSignupTime(DateUtils.currentDate());
        entity.setAuthGuid(UidUtils.UID());
        entity.setPassword(encodeUserPasswd(entity, rawPassword));
        return signupUserDao.save(entity);
    }

    public User auditNewUser(SignupUser entity) {
        User user = entity.getUser();
        String[] selectedRoleIds = user.getSelectedRoleIds();
        if (selectedRoleIds != null && selectedRoleIds.length > 0) {
            List<UserR2Role> userR2Roles = Lists.newArrayList();
            for (String selectedRoleId : selectedRoleIds) {
                UserR2Role r2 = new UserR2Role();
                r2.setUser(user);
                r2.setRole(roleDao.findOne(selectedRoleId));
                userR2Roles.add(r2);
            }
            user.setUserR2Roles(userR2Roles);
        }
        user.setAuthUid(entity.getAuthUid());
        user.setAuthGuid(entity.getAuthGuid());
        user.setPassword(entity.getPassword());
        user.setMobile(entity.getMobile());
        user.setEmail(entity.getEmail());
        user.setTrueName(entity.getTrueName());
        user.setNickName(entity.getNickName());
        if (StringUtils.isBlank(user.getNickName())) {
            user.setNickName(user.getAuthUid());
        }

        userDao.save(user);

        UserExt userExt = new UserExt();
        userExt.setId(user.getId());
        userExt.setSignupTime(entity.getSignupTime());
        userExtDao.save(userExt);

        entity.setAuditTime(DateUtils.currentDate());
        signupUserDao.save(entity);

        return user;
    }
}
