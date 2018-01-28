package com.gdtopway.biz.fund.entity;


import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.entity.BaseEntity;
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
@Table(name = "fund_Customer_Contact")
@MetaData(value = "客户联系人信息表")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FunfCustomerContact extends BaseEntity<String> {

    private static final long serialVersionUID = 8283298365373612832L;

    @MetaData(value = "共享主键", comments = "对应主对像ID")
    @Id
    @Column(nullable = false, unique = true)
    //@JsonSerialize(using = IdSerialize.class)
    private String id;

    @MetaData(value = "父亲姓名")
    @Column(length = 100,nullable = false)
    String fathername;

    @MetaData(value = "父亲电话")
    @Column(length = 100,nullable = false)
    String fatherphone;

    @MetaData(value = "母亲姓名")
    @Column(length = 100,nullable = false)
    String mothername;

    @MetaData(value = "母亲电话")
    @Column(length = 100,nullable = false)
    String motherphone;

    @MetaData(value = "配偶姓名")
    @Column(length = 100,nullable = false)
    String matename;

    @MetaData(value = "配偶电话")
    @Column(length = 100,nullable = false)
    String matephone;

    @MetaData(value = "朋友姓名")
    @Column(length = 100,nullable = false)
    String friendname;

    @MetaData(value = "朋友电话")
    @Column(length = 100,nullable = false)
    String friendphone;
}
