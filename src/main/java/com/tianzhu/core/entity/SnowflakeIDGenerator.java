package com.tianzhu.core.entity;

import java.io.Serializable;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.type.Type;
import org.springframework.util.Assert;

import com.tianzhu.core.util.id.IdWorker;

public class SnowflakeIDGenerator implements IdentifierGenerator,Configurable  {

	protected IdWorker idWorker;
	
	@Override
	public void configure(Type type, Properties params, Dialect d)
			throws MappingException {
		/*String workerId = params.getProperty("workerId") ;
		workerId = StringUtils.isBlank(workerId) ? "0" : workerId;
		String datacenterId = params.getProperty("datacenterId") == null ? "0" : params.getProperty("datacenterId");
		datacenterId = StringUtils.isBlank(datacenterId) ? "0" : datacenterId;
		if(!StringUtils.isNumeric(workerId) || !StringUtils.isNumeric(datacenterId)){
			 throw new IllegalArgumentException(String.format("workerId {%d} or datacenterId {%d} must be Numeric !", workerId,datacenterId));
		}
		*/
		this.idWorker = new IdWorker();
	}

	@Override
	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {
		
		Assert.notNull(idWorker, "can not construct idWorker for input !");
		return new Long(idWorker.nextId());
	}
	

}
