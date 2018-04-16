package com.tianzhu.biz.fund.service;


import com.tianzhu.biz.fund.entity.FundCustomerPicture;
import com.tianzhu.biz.fund.dao.FundCustomerPictureDao;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FundCustomerPictureService extends BaseService<FundCustomerPicture,String> {
    
    @Autowired
    private FundCustomerPictureDao fundCustomerPictureDao;

    @Override
    protected BaseDao<FundCustomerPicture, String> getEntityDao() {
        return fundCustomerPictureDao;
    }
}
