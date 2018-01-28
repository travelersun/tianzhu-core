package com.gdtopway.biz.fund.web;

import com.gdtopway.biz.fund.entity.FundCustomer;
import com.gdtopway.biz.fund.entity.FundCustomerOrder;
import com.gdtopway.biz.fund.service.FundCustomerService;
import com.gdtopway.biz.shop.entity.SiteUser;
import com.gdtopway.biz.shop.service.SiteUserService;
import com.gdtopway.core.annotation.MenuData;
import com.gdtopway.core.annotation.MetaData;
import com.gdtopway.core.exception.ServiceException;
import com.gdtopway.core.pagination.GroupPropertyFilter;
import com.gdtopway.core.pagination.PropertyFilter;
import com.gdtopway.core.security.AuthContextHolder;
import com.gdtopway.core.security.AuthUserDetails;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.core.util.ImageUtils;
import com.gdtopway.core.web.BaseController;
import com.gdtopway.core.web.captcha.ImageCaptchaServlet;
import com.gdtopway.core.web.filter.WebAppContextInitFilter;
import com.gdtopway.core.web.util.ServletUtils;
import com.gdtopway.core.web.view.OperationResult;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.auth.entity.User.AuthTypeEnum;
import com.gdtopway.module.auth.service.UserService;
import com.gdtopway.module.sys.entity.NotifyMessage;
import com.gdtopway.module.sys.entity.UserMessage;
import com.gdtopway.module.sys.service.NotifyMessageService;
import com.gdtopway.module.sys.service.SmsVerifyCodeService;
import com.gdtopway.module.sys.service.UserMessageService;
import com.gdtopway.support.service.DynamicConfigService;
import com.gdtopway.support.service.MailService;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "/m")
public class MIndexController extends BaseController<SiteUser, String> {

    private final Logger logger = LoggerFactory.getLogger(MIndexController.class);

    @Autowired
    private UserService userService;

    @Autowired
    FundCustomerService fundCustomerService;

    @Autowired
    private SiteUserService siteUserService;

    @Autowired
    private MailService mailService;

    @Autowired
    private SmsVerifyCodeService smsVerifyCodeService;

    @Autowired
    private DynamicConfigService dynamicConfigService;

    @Autowired
    private NotifyMessageService notifyMessageService;

    @Autowired
    private UserMessageService userMessageService;

    @Override
    protected BaseService<SiteUser, String> getEntityService() {
        return siteUserService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String wwwIndex(Model model) {

        User user =  AuthContextHolder.findAuthUser();

        FundCustomer customer = fundCustomerService.findByProperty("phone",user.getAuthUid());

        model.addAttribute("customer",customer);

        return "m/index";
    }


    @RequestMapping(value = "cert", method = RequestMethod.GET)
    public String cert(Model model) {

        User user =  AuthContextHolder.findAuthUser();

        model.addAttribute("user",user);

        return "m/certificate";
    }

    @RequestMapping(value = "certdetail", method = RequestMethod.GET)
    public String certdetail(Model model) {

        User user =  AuthContextHolder.findAuthUser();

        model.addAttribute("user",user);

        return "m/cert-detail";
    }

    @RequestMapping(value = "cert", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult certp(FundCustomerOrder order) {

        User user =  AuthContextHolder.findAuthUser();

        OperationResult result = fundCustomerService.createCustomerOrder(order,user);

        if(result.getCode().equals(OperationResult.SUCCESS)){
            return OperationResult.buildSuccessResult("创建成功");
        }else{
            return OperationResult.buildFailureResult("创建失败");
        }
    }

    @RequestMapping(value = "mycert", method = RequestMethod.GET)
    public String mycert(Model model) {
        return "m/mycert";
    }

    @RequestMapping(value = "/password/forget", method = RequestMethod.GET)
    public String forgetPasswordShow(Model model) {
        model.addAttribute("mailServiceEnabled", mailService.isEnabled());
        return "m/pub/password-forget";
    }

    @RequestMapping(value = "/password/forget", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult forgetPasswordSave(HttpServletRequest request, @RequestParam("uid") String uid, @RequestParam("captcha") String captcha) {
        if (!ImageCaptchaServlet.validateResponse(request, captcha)) {
            return OperationResult.buildFailureResult("验证码不正确，请重新输入");
        }
        User user = userService.findByAuthTypeAndAuthUid(AuthTypeEnum.SYS, uid);
        if (user == null) {
            user = userService.findByProperty("email", uid);
        }
        if (user == null) {
            return OperationResult.buildFailureResult("未找到匹配账号信息，请联系管理员处理");
        }
        String email = user.getEmail();
        if (StringUtils.isBlank(email)) {
            return OperationResult.buildFailureResult("当前账号未设定注册邮箱，请联系管理员先设置邮箱后再进行此操作");
        }

        userService.requestResetPassword(WebAppContextInitFilter.getInitedWebContextFullUrl(), user);
        return OperationResult.buildSuccessResult("找回密码请求处理成功。重置密码邮件已发送至：" + email);
    }


    @RequestMapping(value = "/password/reset", method = RequestMethod.GET)
    public String restPasswordShow(Model model) {
        return "m/password-reset";
    }

    @RequestMapping(value = "/password/reset", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult passwordResetSmsValidate(HttpServletRequest request, SiteUser entity, Model model, @RequestParam("mobile") String mobile,
            @RequestParam("smsCode") String smsCode, @RequestParam(value = "newpasswd", required = false) String newpasswd) {
        if (smsVerifyCodeService.verifySmsCode(request, mobile, smsCode)) {
            User user = userService.findByAuthTypeAndAuthUid(AuthTypeEnum.SYS, mobile);
            if (user == null) {
                return OperationResult.buildFailureResult("号码尚未注册", "NoUser");
            }
            if (StringUtils.isBlank(newpasswd)) {
                return OperationResult.buildSuccessResult("短信验证码校验成功", "SmsOK");
            } else {
                //更新密码失效日期为6个月后
                user.setCredentialsExpireTime(new DateTime().plusMonths(6).toDate());
                userService.save(user, newpasswd);
                return OperationResult.buildSuccessResult("密码重置成功，您可以马上使用新设定密码登录系统啦", "ResetOK");
            }
        } else {
            return OperationResult.buildFailureResult("短信验证码不正确");
        }
    }

    @RequestMapping(value = "/image/upload", method = RequestMethod.GET)
    public String imageUploadShow() {
        return "m/imageUpload";
    }

    private static final String TEMP_PHOTO_FILE_PATH = "/temp/photo/";

    @RequestMapping(value = "/image/upload/temp", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult imageUploadTemp(@RequestParam("photo") CommonsMultipartFile photo, HttpServletRequest request) {
        if (photo != null && !photo.isEmpty()) {
            try {
                String rootDir = WebAppContextInitFilter.getInitedWebContextRealPath();
                String fileName = UUID.randomUUID() + "_" + photo.getOriginalFilename();
                File dir = new File(rootDir + TEMP_PHOTO_FILE_PATH);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String photoFilePath = TEMP_PHOTO_FILE_PATH + fileName;
                logger.debug("Saving file: {}", rootDir + photoFilePath);
                File photoFile = new File(rootDir + photoFilePath);
                photo.transferTo(photoFile);

                BufferedImage bi = ImageIO.read(photoFile);
                int srcWidth = bi.getWidth(); // 源图宽度  
                int srcHeight = bi.getHeight(); // 源图高度  

                Map<String, Object> userdata = Maps.newHashMap();
                userdata.put("width", srcWidth);
                userdata.put("height", srcHeight);
                userdata.put("src", photoFilePath);
                return OperationResult.buildSuccessResult("图片上传成功", userdata);
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        }
        return OperationResult.buildFailureResult("图片上传失败");
    }

    @RequestMapping(value = "/image/crop", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult imageCrop(HttpServletRequest request, @RequestParam("bigImage") String bigImage,
            @RequestParam(value = "x", required = false) Integer x, @RequestParam(value = "y", required = false) Integer y,
            @RequestParam(value = "w", required = false) Integer w, @RequestParam(value = "h", required = false) Integer h,
            @RequestParam(value = "size", required = false) Integer size) throws IOException {
        try {
            String rootDir = WebAppContextInitFilter.getInitedWebContextRealPath();
            String bigImagePath = rootDir + bigImage;
            //判断是否需要先进行裁剪处理
            if (x != null && w != null && w > 0) {
                //裁剪图片
                ImageUtils.cutImage(bigImagePath, bigImagePath, x, y, w, h);
                if (size != null) {
                    //缩放到统一大小
                    ImageUtils.zoomImage(bigImagePath, bigImagePath, size, size);
                }
            }
            File photoFile = new File(bigImagePath);
            String path = ServletUtils.writeUploadFile(new FileInputStream(photoFile), photoFile.getName(), photoFile.length());
            if (StringUtils.isNotBlank(path)) {
                return OperationResult.buildSuccessResult("图片提交成功", path);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return OperationResult.buildFailureResult("图片处理失败");
    }

    @RequestMapping(value = "/image/upload/kind-editor", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> imageUpload(HttpServletRequest request, @RequestParam("imgFile") CommonsMultipartFile fileUpload) {
        Map<String, Object> retMap = Maps.newHashMap();
        try {
            if (fileUpload != null && !fileUpload.isEmpty()) {
                String path = ServletUtils.writeUploadFile(fileUpload.getInputStream(), fileUpload.getOriginalFilename(), fileUpload.getSize());
                if (StringUtils.isNotBlank(path)) {
                    String imgViewUrlPrefix = ServletUtils.getReadFileUrlPrefix();
                    retMap.put("error", 0);
                    retMap.put("url", imgViewUrlPrefix + path);
                    retMap.put("path", path);
                    return retMap;
                }
            }
        } catch (IOException e) {
            throw new ServiceException("Upload file error", e);
        }
        retMap.put("error", 1);
        retMap.put("message", "图片处理失败");
        return retMap;
    }

    @RequestMapping(value = "/file/upload/single", method = RequestMethod.POST)
    @ResponseBody
    public OperationResult singleFileUpload(HttpServletRequest request, @RequestParam("fileData") CommonsMultipartFile fileUpload) {
        try {
            if (fileUpload != null && !fileUpload.isEmpty()) {
                String path = ServletUtils.writeUploadFileM(fileUpload.getInputStream(), fileUpload.getOriginalFilename(), fileUpload.getSize());
                if (StringUtils.isNotBlank(path)) {
                    return OperationResult.buildSuccessResult("文件提交成功", path);
                }
            }
        } catch (IOException e) {
            throw new ServiceException("Upload file error", e);
        }
        return OperationResult.buildFailureResult("文件处理失败");
    }


    @MenuData("个人信息:公告消息")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/notify-message", method = RequestMethod.GET)
    public String notifyMessageIndex() {
        return "m/profile/notifyMessage-index";
    }

    @MetaData("公告消息列表")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/notify-message-list", method = RequestMethod.GET)
    public String notifyMessageList(HttpServletRequest request, Model model) {
        User user = AuthContextHolder.findAuthUser();
        List<NotifyMessage> notifyMessages = null;
        String readed = request.getParameter("readed");
        if (StringUtils.isBlank(readed)) {
            notifyMessages = notifyMessageService.findStatedEffectiveMessages(user, "web_admin", null);
        } else {
            notifyMessages = notifyMessageService.findStatedEffectiveMessages(user, "web_admin",
                    BooleanUtils.toBoolean(request.getParameter("readed")));
        }
        model.addAttribute("notifyMessages", notifyMessages);
        return "m/profile/notifyMessage-list";
    }

    @MetaData("公告消息读取")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/notify-message-view/{messageId}", method = RequestMethod.GET)
    public String notifyMessageView(@PathVariable("messageId") String messageId, Model model) {
        User user = AuthContextHolder.findAuthUser();
        NotifyMessage notifyMessage = notifyMessageService.findOne(messageId);
        notifyMessageService.processUserRead(notifyMessage, user);
        model.addAttribute("notifyMessage", notifyMessage);
        return "m/profile/notifyMessage-view";
    }

    @MenuData("个人信息:个人消息")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/user-message", method = RequestMethod.GET)
    public String userMessageIndex() {
        return "admin/profile/userMessage-index";
    }

    @MetaData("个人消息列表")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/user-message-list", method = RequestMethod.GET)
    public String userMessageList(HttpServletRequest request, Model model) {
        User user = AuthContextHolder.findAuthUser();
        Pageable pageable = PropertyFilter.buildPageableFromHttpRequest(request);
        GroupPropertyFilter groupFilter = GroupPropertyFilter.buildFromHttpRequest(UserMessage.class, request);
        groupFilter.append(new PropertyFilter(PropertyFilter.MatchType.EQ, "targetUser", user));
        String readed = request.getParameter("readed");
        if (StringUtils.isNotBlank(readed)) {
            if (BooleanUtils.toBoolean(request.getParameter("readed"))) {
                groupFilter.append(new PropertyFilter(PropertyFilter.MatchType.NN, "firstReadTime", Boolean.TRUE));
            } else {
                groupFilter.append(new PropertyFilter(PropertyFilter.MatchType.NU, "firstReadTime", Boolean.TRUE));
            }
        }
        Page<UserMessage> pageData = userMessageService.findByPage(groupFilter, pageable);
        model.addAttribute("pageData", pageData);
        return "m/profile/userMessage-list";
    }

    @MetaData("个人消息读取")
    @RequiresRoles(value = AuthUserDetails.ROLE_SITE_USER)
    @RequestMapping(value = "/m/profile/user-message-view/{messageId}", method = RequestMethod.GET)
    public String userMessageView(@PathVariable("messageId") String messageId, Model model) {
        User user = AuthContextHolder.findAuthUser();
        UserMessage userMessage = userMessageService.findOne(messageId);
        userMessageService.processUserRead(userMessage, user);
        model.addAttribute("userMessage", userMessage);
        return "m/profile/userMessage-view";
    }
}
