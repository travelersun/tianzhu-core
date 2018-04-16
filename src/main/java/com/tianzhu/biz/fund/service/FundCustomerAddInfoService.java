package com.tianzhu.biz.fund.service;


import com.tianzhu.biz.fund.entity.FundCustomerAddInfo;
import com.tianzhu.biz.fund.dao.FundCustomerAddInfoDao;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
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
