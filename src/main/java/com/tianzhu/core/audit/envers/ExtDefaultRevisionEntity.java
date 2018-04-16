package com.tianzhu.core.audit.envers;

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

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.entity.PersistableEntity;
import com.tianzhu.core.util.id.IdDeserializer;
import com.tianzhu.core.util.id.IdSerialize;
import com.tianzhu.core.web.json.DateTimeJsonSerializer;
import com.tianzhu.module.auth.entity.User.AuthTypeEnum;

/**
 * 扩展默认的Hibernate Envers审计表对象定义
 * 
 * @see http://docs.jboss.org/hibernate/orm/4.2/devguide/en-US/html/ch15.html
 */
@Getter
@Setter
@Access(AccessType.FIELD)
@Entity
@Table(name = "aud_RevisionEntity")
@RevisionEntity(ExtRevisionListener.class)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "javassistLazyInitializer", "revisionEntity", "handler" }, ignoreUnknown = true)
public class ExtDefaultRevisionEntity extends PersistableEntity<Long> {

    private static final long serialVersionUID = -2946153158442502361L;

    /** 记录版本 */
    @Id
    @RevisionNumber
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    //@GenericGenerator(name = "idGenerator", strategy = "com.tianzhu.core.entity.SnowflakeIDGenerator",
	//parameters = { @Parameter(name = "workerId", value = "0") ,@Parameter(name = "datacenterId", value = "0")})
    @Column(nullable = false, unique = true)
    @JsonSerialize(using = IdSerialize.class)
    private Long rev;

    /** 记录时间 */
    @RevisionTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @JsonSerialize(using = DateTimeJsonSerializer.class)
    private Date revstmp;

    private String entityClassName;

    /** Controller注解定义的requestMapping */
    private String requestMappingUri;

    /** 请求执行的Web Controller类名 */
    private String controllerClassName;

    /** 请求执行的Web Controller类MetaData中文注解 */
    private String controllerClassLabel;

    /** 请求执行的Web Controller方法名 */
    private String controllerMethodName;

    /** 请求执行的Web Controller方法的MetaData中文注解 */
    private String controllerMethodLabel;

    /** 请求执行的Web Controller方法RequestMethod: POST */
    private String controllerMethodType;

    /** 全局唯一的用户ID，确保明确与唯一操作用户关联 */
    @Column(length = 128)
    private String authGuid;

    @MetaData(value = "账号类型所对应唯一标识")
    @Column(length = 128)
    private String authUid;

    @MetaData(value = "账号类型")
    @Column(length = 32)
    @Enumerated(EnumType.STRING)
    private AuthTypeEnum authType;

    @Override
    @Transient
    @JsonSerialize(using = IdSerialize.class)
    public Long getId() {
        return rev;
    }

    @Override
    @Transient
    public boolean isNew() {
        return rev == null;
    }

    @Override
    @Transient
    public String getDisplay() {
        return String.valueOf(rev);
    }

    @Transient
    public String getControllerClassDisplay() {
        if (StringUtils.isBlank(controllerClassName)) {
            return null;
        }
        return controllerClassName + (StringUtils.isBlank(controllerClassLabel) ? "" : "(" + controllerClassLabel + ")");
    }

    @Transient
    public String getControllerMethodDisplay() {
        if (StringUtils.isBlank(controllerMethodName)) {
            return null;
        }
        return controllerMethodName + (StringUtils.isBlank(controllerMethodLabel) ? "" : "(" + controllerMethodLabel + ")");
    }
}
