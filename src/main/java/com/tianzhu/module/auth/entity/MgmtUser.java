package com.tianzhu.module.auth.entity;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.entity.BaseNativeEntity;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "auth_MgmtUser")
@MetaData(value = "管理端用户信息")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MgmtUser extends BaseNativeEntity {

    private static final long serialVersionUID = 512335968914828057L;

    @MetaData(value = "登录账号对象")
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "user_id")
    private User user;

    @MetaData(value = "所属部门")
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "department_id")
    private Department department;

    @Override
    @Transient
    public String getDisplay() {
        return user.getDisplay();
    }
}
