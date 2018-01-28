package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.entity.FundCustomerAddInfo;
import com.gdtopway.biz.fund.dao.FundCustomerAddInfoDao;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FundCustomerAddInfoService extends BaseService<FundCustomerAddInfo,String> {
    
    @Autowired
    private FundCustomerAddInfoDao fundCustomerAddInfoDao;

    @Override
    protected BaseDao<FundCustomerAddInfo, String> getEntityDao() {
        return fundCustomerAddInfoDao;
    }
}
