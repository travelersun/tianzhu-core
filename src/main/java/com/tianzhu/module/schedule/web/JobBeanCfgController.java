package com.tianzhu.module.schedule.web;

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

import com.tianzhu.core.annotation.MenuData;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.service.Validation;
import com.tianzhu.core.web.BaseController;
import com.tianzhu.core.web.view.OperationResult;
import com.tianzhu.module.schedule.entity.JobBeanCfg;
import com.tianzhu.module.schedule.service.JobBeanCfgService;

@Controller
@RequestMapping(value = "/admin/schedule/job-bean-cfg")
public class JobBeanCfgController extends BaseController<JobBeanCfg, String> {

    @Autowired
    private JobBeanCfgService jobBeanCfgService;

    @Override
    protected BaseService<JobBeanCfg, String> getEntityService() {
        return jobBeanCfgService;
    }

    @MenuData("配置管理:计划任务管理:可配置任务管理")
    @RequiresPermissions("配置管理:计划任务管理:可配置任务管理")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/schedule/jobBeanCfg-index";
    }

    @RequiresPermissions("配置管理:计划任务管理:可配置任务管理")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Page<JobBeanCfg> findByPage(HttpServletRequest request) {
        return super.findByPage(JobBeanCfg.class, request);
    }

    @RequiresPermissions("配置管理:计划任务管理:可配置任务管理")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult editSave(@ModelAttribute("entity") JobBeanCfg entity, HttpServletRequest request) {
        Validation.notDemoMode();
        return super.editSave(entity);
    }

    @RequiresUser
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }
}
