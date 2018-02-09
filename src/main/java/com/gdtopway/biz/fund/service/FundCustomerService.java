package com.gdtopway.biz.fund.service;


import com.gdtopway.biz.fund.dao.*;
import com.gdtopway.biz.fund.entity.*;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.core.web.view.OperationResult;
import com.gdtopway.module.auth.entity.User;
import com.gdtopway.module.auth.entity.UserR2Role;
import com.gdtopway.module.auth.service.RoleService;
import com.gdtopway.module.auth.service.UserService;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FundCustomerService extends BaseService<FundCustomer,String> {

    @Autowired
    FundCustomerDao fundCustomerDao;

    @Autowired
    FundCustomerAddInfoDao fundCustomerAddInfoDao;

    @Autowired
    FundCustomerPictureDao fundCustomerPictureDao;

    @Autowired
    FunfCustomerContactDao funfCustomerContactDao;


    @Autowired
    FundCustomerOrderDao fundCustomerOrderDao;


    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Override
    protected BaseDao<FundCustomer, String> getEntityDao() {
        return fundCustomerDao;
    }

    public void createCustomer(FundCustomer customer,
                               FundCustomerAddInfo addInfo,
                               FundCustomerPicture picture,
                               FunfCustomerContact contact){

        //创建用户账号
        User entity = new User();
        entity.setAuthType(User.AuthTypeEnum.SYS);
        entity.setMgmtGranted(false);
        entity.setAuthUid(customer.getPhone());
        entity.setNickName(customer.getName());
        entity.setTrueName(customer.getName());
        entity.setMobile(customer.getPhone());

        entity = userService.save(entity, customer.getPassword());

        customer.setUser(entity);

        customer = fundCustomerDao.save(customer);

        addInfo.setId(customer.getId());
        picture.setId(customer.getId());
        contact.setId(customer.getId());

        addInfo = fundCustomerAddInfoDao.save(addInfo);
        picture = fundCustomerPictureDao.save(picture);
        contact = funfCustomerContactDao.save(contact);
        customer.setFundCustomerAddInfo(addInfo);
        customer.setFundCustomerPicture(picture);
        customer.setFunfCustomerContact(contact);

        fundCustomerDao.save(customer);



    }

    @Override
    protected void preInsert(FundCustomer entity) {

        FundCustomerAddInfo addInfo = fundCustomerAddInfoDao.findOne(entity.getId());
        FundCustomerPicture picture = fundCustomerPictureDao.findOne(entity.getId());
        FunfCustomerContact contact = funfCustomerContactDao.findOne(entity.getId());
        User user =userService.findByAuthUid(entity.getPhone());

        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"");
        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"");
        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"");

        entity.setFundCustomerAddInfo(addInfo);
        entity.setFundCustomerPicture(picture);
        entity.setFunfCustomerContact(contact);
        entity.setUser(user);
        super.preInsert(entity);
    }

    @Override
    protected void preUpdate(FundCustomer entity) {

        FundCustomerAddInfo addInfo = fundCustomerAddInfoDao.findOne(entity.getId());
        FundCustomerPicture picture = fundCustomerPictureDao.findOne(entity.getId());
        FunfCustomerContact contact = funfCustomerContactDao.findOne(entity.getId());
        User user =userService.findByAuthUid(entity.getPhone());

        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"id");
        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"id");
        BeanUtils.copyProperties(addInfo,entity.getFundCustomerAddInfo(),"id");

        entity.setFundCustomerAddInfo(addInfo);
        entity.setFundCustomerPicture(picture);
        entity.setFunfCustomerContact(contact);
        entity.setUser(user);

        super.preUpdate(entity);
    }

    public OperationResult createCustomerOrder(FundCustomerOrder order, User user) {

        FundCustomer fundCustomer = this.findByProperty("phone",user.getAuthUid());

        if(fundCustomer != null){

            order.setFundCustomer(fundCustomer);
            order.setStatus("1");
            fundCustomerOrderDao.save(order);

            return OperationResult.buildSuccessResult();

        }else{

            return OperationResult.buildFailureResult("客户信息不能为空");

        }

    }

    public List<FundCustomerOrder> findOrderByCustomerAndStatus(FundCustomer fundCustomer,String status){

        List<FundCustomerOrder> result = fundCustomerOrderDao.findOrderByCustomerId(fundCustomer.getId(),status);

        return result;

    }

}
