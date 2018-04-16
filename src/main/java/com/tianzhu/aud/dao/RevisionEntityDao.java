package com.tianzhu.aud.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.core.audit.envers.ExtDefaultRevisionEntity;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface RevisionEntityDao extends BaseDao<ExtDefaultRevisionEntity, Long> {

}
