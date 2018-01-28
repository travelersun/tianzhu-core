package com.gdtopway.biz.fund.dao;



import com.gdtopway.core.dao.jpa.BaseDao;
import org.springframework.stereotype.Repository;

import com.gdtopway.biz.fund.entity.FundCustomer;

@Repository
public interface FundCustomerDao extends BaseDao<FundCustomer, String> {

}