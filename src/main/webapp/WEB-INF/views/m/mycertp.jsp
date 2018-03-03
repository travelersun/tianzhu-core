<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

    <c:forEach items="${customer.fundCustomerOrders}" var="order" >
    <a href=" <c:if test="${'1' eq order.status}">javascript:showDialog();</c:if> <c:if test="${'1' != order.status}">${ctx}/m/certdetail?orderId=${order.id}</c:if> " class="card-container">
        <div class="weui-flex border-bottom">
            <div>
                <img src="/assets/account/jiekuanren.png" class="head-img"></div>
            <div class="ml10 text-center">
                <div class="text-dark" style="line-height: 25px;"><shiro:principal property="nickName"/></div>
                <div class="text-xs" style="line-height: 15px;">(借款人)</div>
            </div>
            <div class="weui-flex__item text-right">
                <div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">单位</span>
                    <small class="ml5" style="font-size: 12px;">(元)</small>
                </div>
                <div style="line-height: 25px;"><strong class="text-dark text-xl">${order.loanmoney}</strong></div>
            </div>
        </div>
        <div class="weui-flex border-bottom" style="line-height: 22px;">
            <div class="weui-flex__item">
                <div class="text-xs">利率：${order.yrate}%</div>
                <div class="text-xs">用途：${order.purpose}</div>
            </div>
            <div class="weui-flex__item" style="text-align: right;">
                <div class="text-xs">借款日：<fmt:formatDate value="${order.putoutdate}" pattern="yyyy-MM-dd"/></div>
                <div class="text-xs">还款日：<fmt:formatDate value="${order.maturity}" pattern="yyyy-MM-dd"/></div>
            </div>
        </div>

    </a>
    </c:forEach>