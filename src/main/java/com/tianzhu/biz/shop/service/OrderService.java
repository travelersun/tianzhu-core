package com.tianzhu.biz.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.biz.shop.dao.OrderDao;
import com.tianzhu.biz.shop.entity.Order;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.util.DateUtils;

@Service
@Transactional
public class OrderService extends BaseService<Order, String> {

    @Autowired
    private OrderDao orderDao;

    @Override
    protected BaseDao<Order, String> getEntityDao() {
        return orderDao;
    }

    public Order submitOrder(Order entity) {
        entity.setSubmitTime(DateUtils.currentDate());
        return orderDao.save(entity);
    }
    
    public Order payOrder(Order entity) {
        entity.setPayTime(DateUtils.currentDate());
        return orderDao.save(entity);
    }
}
