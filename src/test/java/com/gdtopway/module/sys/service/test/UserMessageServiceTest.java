package com.gdtopway.module.sys.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.gdtopway.core.test.SpringTransactionalTestCase;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.sys.service.UserMessageService;

public class UserMessageServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private UserMessageService userMessageService;

    @Test
    public void findSiteCountToRead() {
        User user = new User();
        user.setId("1");
        Long count = userMessageService.findCountToRead(user);
        logger.debug("findSiteCountToRead Count: {}", count);
    }

}
