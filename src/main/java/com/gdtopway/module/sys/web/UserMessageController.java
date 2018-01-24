package com.gdtopway.module.sys.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdtopway.core.annotation.MenuData;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.core.web.BaseController;
import com.gdtopway.module.sys.entity.UserMessage;
import com.gdtopway.module.sys.service.UserMessageService;

@Controller
@RequestMapping(value = "/admin/sys/user-message")
public class UserMessageController extends BaseController<UserMessage, String> {

    @Autowired
    private UserMessageService userMessageService;

    @Override
    protected BaseService<UserMessage, String> getEntityService() {
        return userMessageService;
    }

    @RequiresUser
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }

    @MenuData("配置管理:系统管理:消息管理")
    @RequiresPermissions("配置管理:系统管理:消息管理")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/sys/userMessage-index";
    }

    @RequiresPermissions("配置管理:系统管理:消息管理")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Page<UserMessage> findByPage(HttpServletRequest request) {
        return super.findByPage(UserMessage.class, request);
    }

    @RequiresPermissions("配置管理:系统管理:消息管理")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editShow(Model model) {
        return "admin/sys/userMessage-inputBasic";
    }
}
