package com.gdtopway.biz.fund.entity;

import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.entity.BaseNativeEntity;
import com.gdtopway.module.auth.entity.User;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "fund_Customer")
@MetaData(value = "客户信息表")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FundCustomer extends BaseNativeEntity {

    private static final long serialVersionUID = 3583296283373036832L;

    @MetaData(value = "登录账号对象")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    User user;

    @MetaData(value = "姓名")
    @Column(length = 34, nullable = false)
    String name;

    @MetaData(value = "手机号")
    @Column(length = 34, nullable = false,unique = true)
    String phone;

    @MetaData(value = "身份证号")
    @Column(length = 34, nullable = false,unique = true)
    String certid;

    @MetaData(value = "微信号")
    @Column(length = 100)
    String weixin;

    @MetaData(value = "地区")
    @Column(length = 200, nullable = false)
    String region;

    @MetaData(value = "详细地址")
    @Column(length = 500, nullable = false)
    String address;

    @MetaData(value = "月收入")
    @Column(nullable = false)
    Double mincome;

    @MetaData(value = "客户扩展信息对象-补充信息")
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @PrimaryKeyJoinColumn(foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    FundCustomerAddInfo fundCustomerAddInfo;

    @MetaData(value = "客户扩展信息对象-客户身份证照片")
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @PrimaryKeyJoinColumn(foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    FundCustomerPicture fundCustomerPicture;

    @MetaData(value = "客户扩展信息对象-联系人")
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @PrimaryKeyJoinColumn(foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    FunfCustomerContact funfCustomerContact;


    @MetaData(value = "客户借款凭证")
    @OneToMany(mappedBy = "fundCustomer", cascade = CascadeType.ALL, orphanRemoval = true)
    List<FundCustomerOrder> fundCustomerOrders;


    @Transient
    String password;


}
