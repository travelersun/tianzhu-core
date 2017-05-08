package com.gdtopway.module.sys.service.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.gdtopway.core.test.SpringTransactionalTestCase;
import com.gdtopway.module.sys.service.MenuService;
import com.gdtopway.module.sys.vo.NavMenuVO;

public class MenuServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private MenuService menuService;

    @Test
    public void findAvailableNavMenuVOs() {
        List<NavMenuVO> navMenuVOs = menuService.findAvailableNavMenuVOs();
        logger.debug("navMenuVOs size={}", navMenuVOs.size());
        Assert.assertTrue(navMenuVOs.size() > 0);
    }
}
