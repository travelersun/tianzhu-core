package com.gdtopway.module.sys.dao.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.gdtopway.core.test.SpringTransactionalTestCase;
import com.gdtopway.core.util.MockEntityUtils;
import com.gdtopway.module.sys.dao.ConfigPropertyDao;
import com.gdtopway.module.sys.entity.ConfigProperty;

public class ConfigPropertyDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private ConfigPropertyDao configPropertyDao;

    @Test
    public void save() {
        ConfigProperty entity = MockEntityUtils.buildMockObject(ConfigProperty.class);
        configPropertyDao.save(entity);
        configPropertyDao.findAll();
    }
}
