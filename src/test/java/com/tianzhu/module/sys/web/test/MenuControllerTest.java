package com.tianzhu.module.sys.web.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.tianzhu.core.test.SpringControllerTestCase;

/**
 * Controller模拟测试
 * 语法参考：http://docs.spring.io/spring/docs/current/spring-framework-reference/html/testing.html#spring-mvc-test-framework
 */
public class MenuControllerTest extends SpringControllerTestCase {

    @Test
    public void list() throws Exception {
        MvcResult rs = mockMvc.perform(get("/admin/sys/menu/list")).andExpect(status().isOk()).andExpect(jsonPath("$.totalElements").exists())
                .andDo(MockMvcResultHandlers.print()).andReturn();
        String responseBody = rs.getResponse().getContentAsString();
        Assert.assertTrue(responseBody.contains("totalElements"));
    }

}
