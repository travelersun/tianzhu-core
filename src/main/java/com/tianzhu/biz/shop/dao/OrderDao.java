package com.tianzhu.biz.shop.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.biz.shop.entity.Order;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface OrderDao extends BaseDao<Order, String> {

}
