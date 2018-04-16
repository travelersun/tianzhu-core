package com.tianzhu.module.auth.web;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tianzhu.core.annotation.MenuData;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.web.BaseController;
import com.tianzhu.module.auth.entity.Privilege;
import com.tianzhu.module.auth.service.PrivilegeService;

@Controller
@RequestMapping(value = "/admin/auth/privilege")
public class PrivilegeController extends BaseController<Privilege, String> {

    @Autowired
    private PrivilegeService privilegeService;

    @Override
    protected BaseService<Privilege, String> getEntityService() {
        return privilegeService;
    }

    @MenuData("配置管理:权限管理:权限配置")
    @RequiresPermissions("配置管理:权限管理:权限配置")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model) {
        List<Privilege> privileges = privilegeService.findAllCached();
        model.addAttribute("privileges", privileges);
        return "admin/auth/privilege-index";
    }

    @RequiresPermissions("配置管理:权限管理:权限配置")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list() {
        return privilegeService.findAllCached();
    }
}
