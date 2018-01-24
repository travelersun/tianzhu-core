package com.gdtopway.biz.shop.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.biz.shop.entity.Order;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface OrderDao extends BaseDao<Order, String> {

}
