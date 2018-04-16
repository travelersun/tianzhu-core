package com.tianzhu.module.auth.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tianzhu.core.test.SpringTransactionalTestCase;
import com.tianzhu.core.util.MockEntityUtils;
import com.tianzhu.module.auth.entity.User;
import com.tianzhu.module.auth.service.UserService;

public class UserServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private UserService userService;

    /*@Test
    public void findDetachedOne() {
        User user = new User();
        user.setId("1L");
        userService.findDetachedOne(user.getId(), "userR2Roles");
    }*/

    @Test
    public void findByAuthTypeAndAuthUid() {
        User entity = MockEntityUtils.buildMockObject(User.class);
        entity.setEmail("123@abc.com");
        userService.save(entity);
        logger.debug("1...");
        userService.findByAuthTypeAndAuthUid(entity.getAuthType(), entity.getAuthUid());
        logger.debug("2...");
        userService.findByAuthTypeAndAuthUid(entity.getAuthType(), entity.getAuthUid());
        
        logger.debug("3...");
        userService.findByAuthTypeAndAccessToken(entity.getAuthType(), entity.getAccessToken());
        logger.debug("4...");
        userService.findByAuthTypeAndAccessToken(entity.getAuthType(), entity.getAccessToken());
    }
}
