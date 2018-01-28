
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
 <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <titleView Order</title>
  </head>
  <h1>View Order</h1>
  <a href="${flowExecutionUrl}&_eventId=confirmed">Confirmed</a>
  <a href="${flowExecutionUrl}&_eventId=preStep">Return to PreStep</a>
   <div>
    <table border="1">
    <tr>
    <td>手机号</td>
    <td>${customer.phone}</td>
    </tr>
    <tr>
        <td>姓名</td>
        <td>${customer.name}</td>
    </tr>
    <tr>
       <td>身份证号</td>
       <td>${customer.certid}</td>
    </tr>
    <tr>
           <td>身份证正面</td>
           <td><img class="weui-uploader__file" src="${cpicture.forntcertpict}"></td>
     </tr>
    <tr>
           <td>身份证反面</td>
           <td><img class="weui-uploader__file" src="${cpicture.rearcertpict}"></td>
    </tr>


     <tr>
            <td>手持身份证</td>
            <td><img class="weui-uploader__file" src="${cpicture.handpict}"></td>
     </tr>
    <tr>
       <td>地区</td>
       <td>${customer.region}</td>
    </tr>
    <tr>
       <td>详细地址</td>
       <td>${customer.address}</td>
    </tr>
    <tr>
       <td>微信号</td>
       <td>${customer.weixin}</td>
    </tr>
    <tr>
       <td>月收入</td>
       <td>${caddinfo.mincome}</td>
    </tr>
    <tr>
       <td>公司名称</td>
       <td>${caddinfo.company}</td>
    </tr>
    <tr>
       <td>公司地址</td>
       <td>${caddinfo.compnyaddr}</td>
    </tr>
    <tr>
       <td>公司电话</td>
       <td>${caddinfo.companyphone}</td>
    </tr>
    <tr>
       <td>父亲姓名</td>
       <td>${cocntact.fathername}</td>
    </tr>
    <tr>
       <td>父亲电话</td>
       <td>${cocntact.fatherphone}</td>
    </tr>

    <tr>
       <td>母亲姓名</td>
       <td>${cocntact.mothername}</td>
    </tr>
    <tr>
       <td>母亲电话</td>
       <td>${cocntact.motherphone}</td>
    </tr>
    <tr>
       <td>配偶姓名</td>
       <td>${cocntact.matename}</td>
    </tr>
    <tr>
       <td>配偶电话</td>
       <td>${cocntact.matephone}</td>
    </tr>
    <tr>
       <td>朋友姓名</td>
       <td>${cocntact.friendname}</td>
    </tr>
    <tr>
       <td>朋友电话</td>
       <td>${cocntact.friendphone}</td>
    </tr>
    </table>
   </div>

  </body>
  </html>
