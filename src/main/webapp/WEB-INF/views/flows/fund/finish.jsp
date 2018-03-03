
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
 <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>View Order</title>
  </head>
  <a href="${flowExecutionUrl}&_eventId=confirmed">Confirmed</a>
   <div>
       <h1>您提交的额度申请已经初审通过，授信额度${creditAmount}元，请添加以下二维码进行合同签署及放款</h1>
       <img src="${weixinImgPath}">
       <a style=" font-size:30px;" href="${flowExecutionUrl}&_eventId=confirmed">确定</a>

   </div>

  </body>
  </html>
