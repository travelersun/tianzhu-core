package com.gdtopway.biz.fund.dao;

import com.gdtopway.biz.fund.entity.FundCustomer;
import com.gdtopway.core.dao.jpa.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public interface FundCustomerDao extends BaseDao<FundCustomer, String> {
}
