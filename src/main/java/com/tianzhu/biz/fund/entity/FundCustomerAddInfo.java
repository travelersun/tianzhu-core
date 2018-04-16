package com.tianzhu.biz.fund.entity;

import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.entity.BaseEntity;
import com.tianzhu.core.entity.BaseNativeEntity;
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
@Table(name = "fund_Customer_Addinfo")
@MetaData(value = "客户补充信息表")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FundCustomerAddInfo extends BaseEntity<String> {

    private static final long serialVersionUID = 3583298365373612832L;

    @MetaData(value = "共享主键", comments = "对应主对像ID")
    @Id
    @Column(nullable = false, unique = true)
    //@JsonSerialize(using = IdSerialize.class)
    private String id;

    @MetaData(value = "公司名称")
    @Column(length = 200,nullable = false)
    String company;

    @MetaData(value = "公司地址")
    @Column(length = 500,nullable = false)
    String compnyaddr;

    @MetaData(value = "公司电话")
    @Column(length = 100,nullable = false)
    String companyphone;

    @Transient
    Double mincome;
}
