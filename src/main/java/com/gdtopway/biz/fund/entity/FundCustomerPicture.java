package com.gdtopway.biz.fund.entity;


import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.entity.BaseNativeEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "fund_Customer_Picture")
@MetaData(value = "客户照片表")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FundCustomerPicture extends BaseNativeEntity {

    private static final long serialVersionUID = 3583298365373036832L;


    @MetaData(value = "正面身份证")
    @Column(length = 500, nullable = false)
    String forntcertpict;   //正面身份证

    @MetaData(value = "反面身份证")
    @Column(length = 500, nullable = false)
    String rearcertpict;    //反面身份证

    @MetaData(value = "手持证件")
    @Column(length = 500, nullable = false)
    String handpict;    //手持证件

}
