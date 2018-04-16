package com.tianzhu.module.sys.entity;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.entity.BaseNativeEntity;
import com.tianzhu.core.web.json.EntityIdDisplaySerializer;
import com.tianzhu.module.auth.entity.User;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "sys_UserProfileData", uniqueConstraints = @UniqueConstraint(columnNames = { "user_id", "code" }))
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@MetaData(value = "用户配置数据")
public class UserProfileData extends BaseNativeEntity {

    private static final long serialVersionUID = -3203959719354074416L;

    @MetaData(value = "用户")
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @JsonSerialize(using = EntityIdDisplaySerializer.class)
    private User user;

    @MetaData(value = "代码")
    @Column(length = 128, nullable = false)
    private String code;

    @MetaData(value = "参数值")
    @Column(length = 128, nullable = true)
    private String value;
}
