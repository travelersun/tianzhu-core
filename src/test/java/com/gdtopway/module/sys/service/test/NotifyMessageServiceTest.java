package com.gdtopway.module.sys.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.gdtopway.core.test.SpringTransactionalTestCase;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.sys.service.NotifyMessageService;

public class NotifyMessageServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private NotifyMessageService notifyMessageService;

    @Test
    public void findSiteCountToRead() {
        User user = new User();
        user.setId("1");
        Long count = notifyMessageService.findCountToRead(user, "web-admin");
        logger.debug("findSiteCountToRead Count: {}", count);
    }
}
