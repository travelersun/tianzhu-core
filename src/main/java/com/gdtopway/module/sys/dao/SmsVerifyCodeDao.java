package com.gdtopway.module.sys.dao;

import java.util.Date;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.sys.entity.SmsVerifyCode;

@Repository
public interface SmsVerifyCodeDao extends BaseDao<SmsVerifyCode, String> {

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public SmsVerifyCode findByMobileNum(@Param("mobileNum") String mobileNum);

    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    @Query("select count(1) from SmsVerifyCode where firstVerifiedTime is null")
    public int countTodoItems();

    @Modifying
    @Query("delete SmsVerifyCode where firstVerifiedTime is null and expireTime<:now")
    public int batchDeleteExpireItems(@Param("now") Date now);
}