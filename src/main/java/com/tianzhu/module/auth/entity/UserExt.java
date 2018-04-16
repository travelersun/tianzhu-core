package com.tianzhu.module.auth.entity;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.entity.BaseEntity;
import com.tianzhu.core.util.DateUtils;
import com.tianzhu.core.util.id.IdDeserializer;
import com.tianzhu.core.util.id.IdSerialize;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "auth_UserExt")
@MetaData(value = "用户扩展信息对象")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class UserExt extends BaseEntity<String> {

    private static final long serialVersionUID = 8977448800400578128L;

    @MetaData(value = "共享主键", comments = "对应主对像ID")
    @Id
    @Column(nullable = false, unique = true,precision = 19,scale = 0)
    //@JsonSerialize(using = IdSerialize.class)
    private String id;

    @MetaData(value = "注册时间")
    @DateTimeFormat(pattern = DateUtils.DEFAULT_TIME_FORMAT)
    @JsonFormat(pattern = DateUtils.DEFAULT_TIME_FORMAT)
    private Date signupTime;

    @MetaData(value = "最后登录时间")
    @DateTimeFormat(pattern = DateUtils.DEFAULT_TIME_FORMAT)
    @JsonFormat(pattern = DateUtils.DEFAULT_TIME_FORMAT)
    private Date lastLogonTime;

    @MetaData(value = "最后登录IP")
    private String lastLogonIP;

    @MetaData(value = "最后登录主机名")
    private String lastLogonHost;

    @MetaData(value = "总计登录次数")
    private Integer logonTimes = 0;

    @MetaData(value = "最近认证失败时间")
    private Date lastLogonFailureTime;

    @MetaData(value = "随机数", comments = "用于找回密码设定的随机UUID字符串")
    private String randomCode;
}
