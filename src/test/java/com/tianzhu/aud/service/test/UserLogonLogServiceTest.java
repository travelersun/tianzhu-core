package com.tianzhu.aud.service.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tianzhu.aud.service.UserLogonLogService;
import com.tianzhu.core.test.SpringTransactionalTestCase;

public class UserLogonLogServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private UserLogonLogService userLogonLogService;

    @Test
    public void findGroupByLogonDay() {
        List<Map<String, Object>> items = userLogonLogService.findGroupByLogonDay();
        for (Map<String, Object> item : items) {
            logger.debug("Item: {}", item);
        }
    }
}
