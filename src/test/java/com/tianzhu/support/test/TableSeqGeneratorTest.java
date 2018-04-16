package com.tianzhu.support.test;

import org.junit.Test;

import com.tianzhu.core.test.SpringTransactionalTestCase;
import com.tianzhu.support.service.TableSeqGenerator;

public class TableSeqGeneratorTest extends SpringTransactionalTestCase {

    @Test
    public void testDefaultedTableBackedConfiguration() {
        TableSeqGenerator seqGenerator = new TableSeqGenerator("ORDER_ID", 1000, 100);
        for (int i = 0; i < 30; i++) {
            Long nextVal = seqGenerator.generate(dataSource);
            logger.debug(i + " nextVal: {}", nextVal);
        }

        TableSeqGenerator seqGenerator2 = new TableSeqGenerator("USER_ID", 100000, 7);
        for (int i = 0; i < 40; i++) {
            Long nextVal = seqGenerator2.generate(dataSource);
            logger.debug(i + " nextVal: {}", nextVal);
        }
    }
}
