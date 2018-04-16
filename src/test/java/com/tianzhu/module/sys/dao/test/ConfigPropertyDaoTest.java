package com.tianzhu.module.sys.dao.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tianzhu.core.test.SpringTransactionalTestCase;
import com.tianzhu.core.util.MockEntityUtils;
import com.tianzhu.module.sys.dao.ConfigPropertyDao;
import com.tianzhu.module.sys.entity.ConfigProperty;

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
