package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.entity.FunfCustomerContact;
import com.gdtopway.biz.fund.dao.FunfCustomerContactDao;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FunfCustomerContactService extends BaseService<FunfCustomerContact,String> {
    
    @Autowired
    private FunfCustomerContactDao funfCustomerContactDao;

    @Override
    protected BaseDao<FunfCustomerContact, String> getEntityDao() {
        return funfCustomerContactDao;
    }
}
