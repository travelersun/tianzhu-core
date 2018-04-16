package com.tianzhu.module.sys.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tianzhu.core.annotation.MenuData;
import com.tianzhu.core.cons.GlobalConstant;
import com.tianzhu.core.pagination.GroupPropertyFilter;
import com.tianzhu.core.pagination.PropertyFilter;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.core.service.Validation;
import com.tianzhu.core.util.DateUtils;
import com.tianzhu.core.util.EnumUtils;
import com.tianzhu.core.web.BaseController;
import com.tianzhu.core.web.view.OperationResult;
import com.tianzhu.module.sys.entity.NotifyMessage;
import com.tianzhu.module.sys.entity.NotifyMessageRead;
import com.tianzhu.module.sys.entity.NotifyMessage.NotifyMessagePlatformEnum;
import com.tianzhu.module.sys.service.DataDictService;
import com.tianzhu.module.sys.service.NotifyMessageReadService;
import com.tianzhu.module.sys.service.NotifyMessageService;

@Controller
@RequestMapping(value = "/admin/sys/notify-message")
public class NotifyMessageController extends BaseController<NotifyMessage, String> {

    @Autowired
    private NotifyMessageService notifyMessageService;

    @Autowired
    private NotifyMessageReadService notifyMessageReadService;

    @Autowired
    private DataDictService dataDictService;

    @Override
    protected BaseService<NotifyMessage, String> getEntityService() {
        return notifyMessageService;
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        super.initBinder(binder);
        binder.registerCustomEditor(Date.class, "publishTime", new CustomDateEditor(new SimpleDateFormat(DateUtils.SHORT_TIME_FORMAT), true));
        binder.registerCustomEditor(Date.class, "expireTime", new CustomDateEditor(new SimpleDateFormat(DateUtils.SHORT_TIME_FORMAT), true));
    }

    @RequiresUser
    @ModelAttribute
    public void prepareModel(HttpServletRequest request, Model model, @RequestParam(value = "id", required = false) String id) {
        super.initPrepareModel(request, model, id);
    }

    @MenuData("配置管理:系统管理:公告管理")
    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/sys/notifyMessage-index";
    }

    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Page<NotifyMessage> findByPage(HttpServletRequest request) {
        return super.findByPage(NotifyMessage.class, request);
    }

    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editShow(Model model) {
        model.addAttribute("platformMap", EnumUtils.getEnumDataMap(NotifyMessagePlatformEnum.class));
        model.addAttribute("messageTypeMap", dataDictService.findMapDataByRootPrimaryKey(GlobalConstant.DataDict_Message_Type));
        return "admin/sys/notifyMessage-inputBasic";
    }

    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult editSave(@ModelAttribute("entity") NotifyMessage entity, Model model) {
        return super.editSave(entity);
    }

    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult delete(@ModelAttribute("entity") NotifyMessage entity, Model model) {
        Integer readCount = notifyMessageReadService.countByNotifyMessage(entity);
        Validation.isTrue(readCount <= 0, "该公告已经被阅读，不能被删除");
        notifyMessageService.delete(entity);
        return OperationResult.buildSuccessResult();
    }

    @RequiresPermissions("配置管理:系统管理:公告管理")
    @RequestMapping(value = "/read-list", method = RequestMethod.GET)
    @ResponseBody
    public Page<NotifyMessageRead> readList(HttpServletRequest request) {
        Pageable pageable = PropertyFilter.buildPageableFromHttpRequest(request);
        GroupPropertyFilter groupFilter = GroupPropertyFilter.buildFromHttpRequest(NotifyMessageRead.class, request);
        return notifyMessageReadService.findByPage(groupFilter, pageable);
    }

}
