package com.gdtopway.core.dao.mongo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.gdtopway.core.pagination.GroupPropertyFilter;
import com.mongodb.DB;
import com.mongodb.DBObject;

public interface MongoDao {

    DB getDB();

    Page<DBObject> findPage(String collectionName, GroupPropertyFilter groupPropertyFilter, Pageable pageable, DBObject fields);

    boolean save(String collectionName, DBObject queryData, DBObject saveData);
}
