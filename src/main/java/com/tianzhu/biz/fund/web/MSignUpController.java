package com.tianzhu.biz.fund.web;

import com.tianzhu.core.cons.GlobalConstant;
import com.tianzhu.core.security.AuthUserDetails;
import com.tianzhu.core.security.PasswordService;
import com.tianzhu.core.security.ShiroJdbcRealm;
import com.tianzhu.core.web.captcha.ImageCaptchaServlet;
import com.tianzhu.core.web.view.OperationResult;
import com.tianzhu.module.auth.entity.SignupUser;
import com.tianzhu.module.auth.service.SignupUserService;
import com.tianzhu.module.auth.service.UserService;
import com.tianzhu.module.sys.service.MenuService;
import com.tianzhu.module.sys.service.NotifyMessageService;
import com.tianzhu.module.sys.service.UserMessageService;
import com.tianzhu.support.service.DynamicConfigService;
import com.tianzhu.support.service.MailService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MSignUpController {

    private final Logger logger = LoggerFactory.getLogger(MSignUpController.class);

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    @Autowired
    private SignupUserService signupUserService;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private MailService mailService;

    @Autowired
    private DynamicConfigService dynamicConfigService;

    @Autowired
    private NotifyMessageService notifyMessageService;

    @Autowired
    private UserMessageService userMessageService;

    @Autowired(required = false)
    private ShiroJdbcRealm shiroJdbcRealm;

    @Autowired(required = false)
    private AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor;

    @RequiresRoles(AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/dashboard", method = RequestMethod.GET)
    public String dashboard(Model model) {
        return "m/dashboard";
    }


    @RequestMapping(value = "/m/signup", method = RequestMethod.GET)
    public String signupShow(Model model) {
        model.addAttribute("mailServiceEnabled", mailService.isEnabled());
        return "admin/pub/signup";
    }

    @RequestMapping(value = "/m/signup", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult signupSave(HttpServletRequest request, @RequestParam("captcha") String captcha, @ModelAttribute("entity") SignupUser entity) {
        if (!ImageCaptchaServlet.validateResponse(request, captcha)) {
            return OperationResult.buildFailureResult("验证码不正确，请重新输入");
        }
        if (dynamicConfigService.getBoolean(GlobalConstant.cfg_mgmt_signup_disabled, false)) {
            return OperationResult.buildFailureResult("系统暂未开发账号注册功能，如有疑问请联系管理员");
        }
        signupUserService.signup(entity, request.getParameter("password"));
        return OperationResult.buildSuccessResult("注册成功。需要等待管理员审批通过后方可登录系统。");
    }

    /**
     * 验证手机唯一性
     * <p>
     * 业务输入参数列表：
     * <ul>
     * <li><b>mobile</b> 手机号</li>
     * </ul>
     * </p>
     * @param request
     * @return
     */
    @RequestMapping(value = "/m/signup/unique/mobile", method = RequestMethod.GET)
    @ResponseBody
    public boolean authMobileUnique(HttpServletRequest request) {
        String mobile = request.getParameter("mobile");
        if (!CollectionUtils.isEmpty(userService.findByMobile(mobile))) {
            return false;
        }
        if (!CollectionUtils.isEmpty(signupUserService.findByMobile(mobile))) {
            return false;
        }
        return true;
    }

    /**
     * 验证电子邮件唯一性
     * <p>
     * 业务输入参数列表：
     * <ul>
     * <li><b>email</b> 电子邮件</li>
     * </ul>
     * </p>
     * @param request
     * @return
     */
    @RequestMapping(value = "/m/signup/unique/email", method = RequestMethod.GET)
    @ResponseBody
    public boolean authEmailUnique(HttpServletRequest request) {
        String email = request.getParameter("email");
        if (!CollectionUtils.isEmpty(userService.findByEmail(email))) {
            return false;
        }
        if (!CollectionUtils.isEmpty(signupUserService.findByEmail(email))) {
            return false;
        }
        return true;
    }

    /**
     * 验证电子邮件唯一性
     * <p>
     * 业务输入参数列表：
     * <ul>
     * <li><b>email</b> 电子邮件</li>
     * </ul>
     * </p>
     * @param request
     * @return
     */
    @RequestMapping(value = "/m/signup/unique/uid", method = RequestMethod.GET)
    @ResponseBody
    public boolean authUidUnique(HttpServletRequest request) {
        String authUid = request.getParameter("authUid");
        if (userService.findByAuthUid(authUid) != null) {
            return false;
        }
        if (signupUserService.findByAuthUid(authUid) != null) {
            return false;
        }
        return true;
    }



}
