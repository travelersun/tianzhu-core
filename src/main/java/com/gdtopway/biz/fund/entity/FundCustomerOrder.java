package com.gdtopway.biz.fund.entity;

import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.entity.BaseNativeEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "fund_Customer_Order")
@MetaData(value = "客户借款凭证表")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FundCustomerOrder extends BaseNativeEntity {


    @MetaData(value = "客户信息对象")
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "fund_Customer_id", nullable = false)
    FundCustomer fundCustomer;

    @MetaData(value = "出借人名称")
    @Column(length = 100,nullable = false)
    String lendername;

    @MetaData(value = "借款日期")
    @Column(nullable = false)
    Date putoutdate;

    @MetaData(value = "还款日期")
    @Column(nullable = false)
    Date maturity;

    @MetaData(value = "借款金额")
    @Column(nullable = false)
    Double loanmoney;

    @MetaData(value = "年化利率")
    @Column(length = 100,nullable = false)
    Double yrate;

    @MetaData(value = "借款用途")
    @Column(length = 2000,nullable = false)
    String purpose;

    @MetaData(value = "备注")
    @Column(length = 200,nullable = false)
    String remark;

    @MetaData(value = "服务费")
    @Column(nullable = false)
    Double servicemonry;

    @MetaData(value = "状态")
    @Column(length = 100,nullable = false)
    String status;

}
