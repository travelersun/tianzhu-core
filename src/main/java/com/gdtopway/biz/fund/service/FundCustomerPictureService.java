package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.entity.FundCustomerPicture;
import com.gdtopway.biz.fund.dao.FundCustomerPictureDao;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
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
