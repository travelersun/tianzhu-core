<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String url = request.getContextPath() + "/m";
    if (request.getQueryString() != null) {
        url = url + "?" + request.getQueryString();
    }
    response.sendRedirect(url);
%>