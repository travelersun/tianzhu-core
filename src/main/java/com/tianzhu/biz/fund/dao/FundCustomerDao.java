package com.tianzhu.biz.fund.dao;



import com.tianzhu.core.dao.jpa.BaseDao;
import org.springframework.stereotype.Repository;

import com.tianzhu.biz.fund.entity.FundCustomer;

@Repository
public interface FundCustomerDao extends BaseDao<FundCustomer, String> {

}