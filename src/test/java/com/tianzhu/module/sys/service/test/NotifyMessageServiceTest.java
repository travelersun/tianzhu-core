package com.tianzhu.module.sys.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tianzhu.core.test.SpringTransactionalTestCase;
import com.tianzhu.module.auth.entity.User;
import com.tianzhu.module.sys.service.NotifyMessageService;

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
