package com.gdtopway.aud.entity;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.entity.PersistableEntity;
import com.gdtopway.core.util.DateUtils;
import com.gdtopway.core.util.id.IdDeserializer;
import com.gdtopway.core.util.id.IdSerialize;
import com.gdtopway.core.web.json.DateTimeJsonSerializer;
import com.gdtopway.module.auth.entity.User.AuthTypeEnum;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "auth_UserLogonLog")
@Cache(usage = CacheConcurrencyStrategy.NONE)
@MetaData(value = "用户登录登出历史记录")
public class UserLogonLog extends PersistableEntity<Long> {

    private static final long serialVersionUID = 4034691676061136485L;

    @Id
    @GeneratedValue(generator = "idGenerator")
    //@GenericGenerator(name = "idGenerator", strategy = "native")
    @GenericGenerator(name = "idGenerator", strategy = "com.gdtopway.core.entity.SnowflakeIDGenerator",
	parameters = { @Parameter(name = "workerId", value = "0") ,@Parameter(name = "datacenterId", value = "0")})
    @Column(nullable = false, unique = true,precision = 19,scale = 0)
    @JsonSerialize(using = IdSerialize.class)
    private Long id;

    @MetaData(value = "账号全局唯一标识", comments = "同时作为SYS类型用户登录密码的SALT")
    @Column(length = 64, nullable = false)
    private String authGuid;

    @MetaData(value = "账号类型所对应唯一标识")
    @Column(length = 64, nullable = false)
    private String authUid;

    @MetaData(value = "账号类型")
    @Column(length = 8, nullable = false)
    @Enumerated(EnumType.STRING)
    private AuthTypeEnum authType = AuthTypeEnum.SYS;

    @MetaData(value = "便于按日汇总统计的冗余属性")
    @Column(nullable = true)
    private String logonYearMonthDay;

    @MetaData(value = "登录时间")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    @JsonSerialize(using = DateTimeJsonSerializer.class)
    private Date logonTime;

    @MetaData(value = "登出时间")
    @Temporal(TemporalType.TIMESTAMP)
    @JsonSerialize(using = DateTimeJsonSerializer.class)
    private Date logoutTime;

    @MetaData(value = "登录时长")
    private Long logonTimeLength;

    @MetaData(value = "登录次数")
    private Integer logonTimes;

    @MetaData(value = "userAgent")
    private String userAgent;

    @MetaData(value = "xforwardFor")
    private String xforwardFor;

    @MetaData(value = "localAddr")
    private String localAddr;

    @MetaData(value = "localName")
    private String localName;

    @MetaData(value = "localPort")
    private Integer localPort;

    @MetaData(value = "remoteAddr")
    private String remoteAddr;

    @MetaData(value = "remoteHost")
    private String remoteHost;

    @MetaData(value = "remotePort")
    private Integer remotePort;

    @MetaData(value = "serverIP")
    private String serverIP;

    @MetaData(value = "Session编号")
    @Column(length = 128, nullable = false, unique = true)
    private String httpSessionId;

    @Override
    @Transient
    public String getDisplay() {
        return authType + ":" + authUid;
    }

    @Transient
    public String getLogonTimeLengthFriendly() {
        return DateUtils.getHumanDisplayForTimediff(logonTimeLength);
    }
}