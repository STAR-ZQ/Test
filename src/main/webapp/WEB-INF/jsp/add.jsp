<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            var data = {
                "content": $("[name=content]").val(),
                "invid": $("[name=invid]").val(),
                "author": $("[name=author]").val()
            };
            $.ajax({
                url: "/InvitationManager/addSave",
                data: JSON.stringify(data),
                contentType: "application/json",
                type: "POST",
                success: function (data) {
                    if (data == true) {
                        alert("添加回复成功");
                        location.href = "/InvitationManager/view?invid=" + $("[name=invid]").val();
                    } else {
                        alert("添加回复失败");
                        location.href = "/InvitationManager/view?invid=" + $("[name=invid]").val();
                    }
                }
            })
        })
    })
</script>
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
</head>

<body>
<form action="javascript:;"
      method="post">
    <input type="hidden" name="invid" value="${invid}"/>

    <table border="1" align="center">
        <tr style="background-color: #8cfefa">
            <th colspan="2"><h3>添加回复</h3></th>
        </tr>
        <tr rowspan="2">
            <td>回复内容：</td>
            <td><textarea name="content"></textarea></td>
        </tr>
        <tr>
            <td>回复昵称：</td>
            <td><input type="text" name="author"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input type="button" id="submit" value="提交"/> &nbsp;&nbsp;&nbsp;
                <input
                        type="button" value="返回" onclick="history.back();"/></td>
        </tr>
    </table>
</form>
</body>
</html>
