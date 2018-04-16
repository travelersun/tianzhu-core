package com.tianzhu.biz.fund.web;

import javax.servlet.http.HttpServletRequest;


import com.tianzhu.core.annotation.MenuData;
import com.tianzhu.core.annotation.MetaData;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.web.BaseController;
import com.tianzhu.core.web.json.JsonViews;
import com.tianzhu.core.web.view.OperationResult;
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

import com.tianzhu.biz.fund.entity.FundCustomerPicture;
import com.tianzhu.biz.fund.service.FundCustomerPictureService;

import com.fasterxml.jackson.annotation.JsonView;

@MetaData("现金贷管理:客户照片表管理")
@Controller
@RequestMapping(value = "/admin/fund/fund-customer-picture")
public class FundCustomerPictureController extends BaseController<FundCustomerPicture,String> {

    @Autowired
    private FundCustomerPictureService fundCustomerPictureService;

    @Override
    protected BaseService<FundCustomerPicture, String> getEntityService() {
        return fundCustomerPictureService;
    }
    
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }
    
    @MenuData("现金贷管理:客户照片表")
    @RequiresPermissions("现金贷管理:客户照片表")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/fund/fundCustomerPicture-index";
    }   
    
    @RequiresPermissions("现金贷管理:客户照片表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    @JsonView(JsonViews.Admin.class)
    public Page<FundCustomerPicture> findByPage(HttpServletRequest request) {
        return super.findByPage(FundCustomerPicture.class, request);
    }
    
    @RequestMapping(value = "/edit-tabs", method = RequestMethod.GET)
    public String editTabs(HttpServletRequest request) {
        return "admin/fund/fundCustomerPicture-inputTabs";
    }

    @RequiresPermissions("现金贷管理:客户照片表")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editShow(Model model) {
        return "admin/fund/fundCustomerPicture-inputBasic";
    }

    @RequiresPermissions("现金贷管理:客户照片表")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult editSave(@ModelAttribute("entity") FundCustomerPicture entity, Model model) {
        return super.editSave(entity);
    }

    @RequiresPermissions("现金贷管理:客户照片表")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult delete(@RequestParam("ids") String... ids) {
        return super.delete(ids);
    }
}