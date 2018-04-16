package com.tianzhu.module.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.module.sys.dao.ConfigPropertyDao;
import com.tianzhu.module.sys.entity.ConfigProperty;

@Service
@Transactional
public class ConfigPropertyService extends BaseService<ConfigProperty, String> {

    @Autowired
    private ConfigPropertyDao configPropertyDao;

    public List<ConfigProperty> findAllCached() {
        return configPropertyDao.findAllCached();
    }

    @Override
    protected BaseDao<ConfigProperty, String> getEntityDao() {
        return configPropertyDao;
    }

    @Transactional(readOnly = true)
    public ConfigProperty findByPropKey(String propKey) {
        return configPropertyDao.findByPropKey(propKey);
    }

    @Transactional(readOnly = true)
    public String findValueByPropKey(String propKey) {
        ConfigProperty configProperty = configPropertyDao.findByPropKey(propKey);
        if (configProperty != null) {
            return configProperty.getSimpleValue();
        }
        return null;
    }

    @Transactional(readOnly = true)
    public String findHtmlByPropKey(String propKey) {
        ConfigProperty configProperty = configPropertyDao.findByPropKey(propKey);
        if (configProperty != null) {
            return configProperty.getHtmlValue();
        }
        return null;
    }
}
