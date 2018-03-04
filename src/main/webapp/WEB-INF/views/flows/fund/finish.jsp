
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
 <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>放款提示</title>
  </head>
  <a href="${flowExecutionUrl}&_eventId=confirmed"></a>
   <div>
       <h1 style="font-size:90px">您提交的额度申请已经初审通过，授信额度${creditAmount}元<br/>请添加以下二维码进行合同签署及放款</h1>
       <img src="${weixinImgPath}" width="880" height="880"><br/>
       <a style=" font-size:80px;" href="${flowExecutionUrl}&_eventId=confirmed">确定</a>

   </div>

  </body>
  </html>
