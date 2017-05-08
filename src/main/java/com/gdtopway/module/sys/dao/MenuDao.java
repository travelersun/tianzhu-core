package com.gdtopway.module.sys.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.sys.entity.Menu;

@Repository
public interface MenuDao extends BaseDao<Menu, Long> {

    @Query("from Menu order by inheritLevel asc, orderRank desc")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public List<Menu> findAllCached();
}
