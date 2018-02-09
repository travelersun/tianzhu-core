package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.dao.FundCustomerDao;
import com.gdtopway.biz.fund.entity.FundCustomer;
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

    @Autowired
    private FundCustomerService fundCustomerService;

    @Override
    protected BaseDao<FundCustomerOrder, String> getEntityDao() {
        return fundCustomerOrderDao;
    }



    @Override
    protected void preInsert(FundCustomerOrder entity) {

        FundCustomer c = fundCustomerService.findByProperty("phone",entity.getFundCustomer().getPhone());

        entity.setFundCustomer(c);

        super.preInsert(entity);
    }

    @Override
    protected void preUpdate(FundCustomerOrder entity) {

        FundCustomer c = fundCustomerService.findByProperty("phone",entity.getFundCustomer().getPhone());

        entity.setFundCustomer(c);

        super.preUpdate(entity);
    }
}
