package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.entity.FundCustomerOrder;
import com.gdtopway.biz.fund.dao.FundCustomerOrderDao;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FundCustomerOrderService extends BaseService<FundCustomerOrder,String> {
    
    @Autowired
    private FundCustomerOrderDao fundCustomerOrderDao;

    @Override
    protected BaseDao<FundCustomerOrder, String> getEntityDao() {
        return fundCustomerOrderDao;
    }
}
