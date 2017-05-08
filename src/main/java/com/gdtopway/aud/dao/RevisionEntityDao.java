package com.gdtopway.aud.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.core.audit.envers.ExtDefaultRevisionEntity;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface RevisionEntityDao extends BaseDao<ExtDefaultRevisionEntity, Long> {

}
