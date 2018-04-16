package com.tianzhu.module.schedule.job;

import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.module.schedule.BaseQuartzJobBean;

/**
 * 数据库监控统计任务（典型的Quartz集群运行模式的任务）
 */
@MetaData("数据库监控统计")
public class DatabaseMonitorJob extends BaseQuartzJobBean {

    private final static Logger logger = LoggerFactory.getLogger(DatabaseMonitorJob.class);

    @Override
    protected String executeInternalBiz(JobExecutionContext context) {
        logger.debug("Just Mock: Monitor database information running with Spring Quartz cluster mode...");
        return null;
    }

}
