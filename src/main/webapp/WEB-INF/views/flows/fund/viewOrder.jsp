
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
 <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <titleView Order</title>
  </head>
  <h1>View Order</h1>
  <a href="${flowExecutionUrl}&_eventId=returnToIndex">Return to index</a>
  <a href="${flowExecutionUrl}&_eventId=preStep">Return to PreStep</a>
   <div>
    <table border="1">
    <tr>
      <td>手机号</td>
      <td>密码</td>
      <td>姓名</td>
      <td>身份证号</td>
      <td>微信号</td>
      <td>地区</td>
      <td>详细地址</td>
      <td>月收入</td>

    </tr>
    <tr>
      <td>${customer.phone}</td>
      <td>${customer.password}</td>
      <td>${customer.name}</td>
      <td>${customer.certid}</td>
      <td>${customer.weixin}</td>
      <td>${customer.region}</td>
      <td>${customer.address}</td>
      <td>${customer.mincome}</td>
    </tr>
    </table>
   </div>

  </body>
  </html>
