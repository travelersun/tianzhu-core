package com.gdtopway.biz.fund.web;

import javax.servlet.http.HttpServletRequest;

import com.gdtopway.core.annotation.MenuData;
import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.core.web.BaseController;
import com.gdtopway.core.web.json.JsonViews;
import com.gdtopway.core.web.view.OperationResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdtopway.biz.fund.entity.FundCustomer;
import com.gdtopway.biz.fund.service.FundCustomerService;

import com.fasterxml.jackson.annotation.JsonView;

@MetaData("现金贷管理:客户信息管理")
@Controller
@RequestMapping(value = "/admin/fund/fund-customer")
public class FundCustomerController extends BaseController<FundCustomer,String> {

    @Autowired
    private FundCustomerService fundCustomerService;

    @Override
    protected BaseService<FundCustomer, String> getEntityService() {
        return fundCustomerService;
    }
    
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }
    
    @MenuData("现金贷管理:客户信息管理")
    @RequiresPermissions("现金贷管理:客户信息管理")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/fund/fundCustomer-index";
    }   
    
    @RequiresPermissions("现金贷管理:客户信息管理")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    @JsonView(JsonViews.Admin.class)
    public Page<FundCustomer> findByPage(HttpServletRequest request) {
        return super.findByPage(FundCustomer.class, request);
    }
    
    @RequestMapping(value = "/edit-tabs", method = RequestMethod.GET)
    public String editTabs(HttpServletRequest request) {
        return "admin/fund/fundCustomer-inputTabs";
    }

    @RequiresPermissions("现金贷管理:客户信息管理")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editShow(Model model) {
        return "admin/fund/fundCustomer-inputBasic";
    }

    @RequiresPermissions("现金贷管理:客户信息管理")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult editSave(@ModelAttribute("entity") FundCustomer entity, Model model) {
        return super.editSave(entity);
    }

    @RequiresPermissions("现金贷管理:客户信息管理")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult delete(@RequestParam("ids") String... ids) {
        return super.delete(ids);
    }
}