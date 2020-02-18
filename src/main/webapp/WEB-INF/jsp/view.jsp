<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>

    <style type="text/css">
        a {
            text-decoration: none;
        }

        td, th {
            text-align: center;
            width: 120px;
        }
    </style>
</head>
<script type="text/javascript">
    $(function () {
        $("th").css("background-color", "deepskyblue");
        $("tr:even").css("background-color", "#8cfefa");
        $("#add").click(function () {
            $("form").submit();
        });
    });

    function doPage(pageNo) {
        $("[name=pageNo]").val(pageNo);
        $("form").submit();
        // location.href = "/InvitationManager/view?invid=" + $("[name=id]").val();
    }
</script>

<body>

<form action="/InvitationManager/view" method="get">

    <table border="1" align="center">
        <tr rowspan="2">
            <th colspan="3" style="text-align: center;background-color: white">
                <h2 align="center" style="position: relative;bottom: -10px;">回复信息列表</h2>
            </th>
        </tr>
        <tr>
            <td colspan="3" style="text-align:right">
                <a href="${pageContext.request.contextPath}/add?invid=${invid}" style="color: red">添加回复</a> <a
                    href="${pageContext.request.contextPath}/index" style="color: red">返回帖子列表</a> <input
                    type="hidden" name="invid" value="${invid}"/>
            </td>
        </tr>
        <tr>
            <th>回复内容</th>
            <th>回复昵称</th>
            <th>发布时间</th>
        </tr>
        <c:forEach var="list" items="${list}">
            <tr>
                <td>${list.content}</td>
                <td>${list.author}</td>
                <td><fmt:formatDate value="${list.createdate}"
                                    pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
    </table>
    <div align="center">
        <input type="hidden" name="pageNo" value=""/> <span>第${pageNo}/${totalPageCount}页</span>
        <span> <a href="javascript:doPage(1)">首页</a> <a
                href="javascript:doPage(${pageNo-1})">上页</a> <a
                href="javascript:doPage(${pageNo+1})">下页</a> <a
                href="javascript:doPage(${totalPageCount})">末页</a> </span>
    </div>
</form>
</body>
</html>
