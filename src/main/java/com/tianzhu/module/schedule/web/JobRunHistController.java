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

import com.tianzhu.aud.entity.JobRunHist;
import com.tianzhu.aud.service.JobRunHistService;
import com.tianzhu.core.annotation.MenuData;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.web.BaseController;

@Controller
@RequestMapping(value = "/admin/schedule/job-run-hist")
public class JobRunHistController extends BaseController<JobRunHist, String> {

    @Autowired
    private JobRunHistService jobRunHistService;

    @Override
    protected BaseService<JobRunHist, String> getEntityService() {
        return jobRunHistService;
    }

    @MenuData("配置管理:计划任务管理:任务运行记录")
    @RequiresPermissions("配置管理:计划任务管理:任务运行记录")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/schedule/jobRunHist-index";
    }

    @RequiresPermissions("配置管理:计划任务管理:任务运行记录")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Page<JobRunHist> findByPage(HttpServletRequest request) {
        return super.findByPage(JobRunHist.class, request);
    }

    @RequiresPermissions("配置管理:计划任务管理:任务运行记录")
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String htmlPreview() {
        return "admin/schedule/jobRunHist-view";
    }

    @RequiresUser
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }
}
