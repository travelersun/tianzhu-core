package com.tianzhu.biz.fund.dao;




import com.tianzhu.core.dao.jpa.BaseDao;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tianzhu.biz.fund.entity.FundCustomerOrder;

import java.util.List;

@Repository
public interface FundCustomerOrderDao extends BaseDao<FundCustomerOrder, String> {

    @Query(value = "from FundCustomerOrder t where t.fundCustomer.id = :cusId and t.status = :status")
    List<FundCustomerOrder> findOrderByCustomerId( @Param("cusId") String id, @Param("status") String status);
}