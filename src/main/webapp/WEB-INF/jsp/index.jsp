<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

<title>论文</title>

<style type="text/css">
    a {
        text-decoration: none;
        color: blue;
    }

    td, th {
        text-align: center;
        width: 150px;
    }
</style>

<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    function doPage(curPage) {
        $("[name=curPage]").val(curPage);
        sessionStorage.clear();
        $("form").submit();
    }

    $(document).ready(function () {
        $(".color:even").css("background-color", "#8cfefa");

        if (sessionStorage.getItem("msg") == null) {
            $("#msgTr").hide();
        }
    });

    function del(invid) {
        if (confirm('确定删除该条发帖及相关回复？')) {
            // $.getJSON("/InvitationManager/del","id="+invid+"",function (data) {
            //     if (data == true) {
            //         sessionStorage.setItem("msg", "删除成功！");
            //         location.href = "/InvitationManager/index";
            //     } else {
            //         sessionStorage.setItem("msg", "删除失败！");
            //         location.href = "/InvitationManager/index";
            //     }
            // })
            // var data = {"id": invid, "invid": invid};
            $.ajax({
                url: "/InvitationManager/del/" + invid,
                type: "POST",
                success: function (data) {
                    if (data == true) {
                        sessionStorage.setItem("msg", "删除成功！");
                        location.href = "/InvitationManager/index";
                    } else {
                        sessionStorage.setItem("msg", "删除失败！");
                        location.href = "/InvitationManager/index";
                    }
                }
            });
        }
    }
</script>

<body>

<form action="${pageContext.request.contextPath}/index"
      method="POST">
    <%--    <div align="center">--%>

    <%--    </div>--%>
    <table border="1" align="center">
        <tr rowspan="2">
            <th colspan="5" style="text-align: center;">
                <h2 align="center" style="position: relative;bottom: -10px;">帖子列表</h2>
            </th>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center">
                帖子标题：<input type="text" name="title" value="${title}"/> <input
                    type="submit" value="搜索"/>
            </td>
        </tr>
        <tr style="background-color:deepskyblue">
            <th>标题</th>
            <th>内容摘要</th>
            <th>作者</th>
            <th>发布时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="info" items="${list}">
            <tr class="color">
                <td>${info.title}</td>
                <td>${info.summary}</td>
                <td>${info.author}</td>
                <td><fmt:formatDate value="${info.createdate}"
                                    pattern="yyyy-MM-dd"/></td>
                <td><a
                        href="${pageContext.request.contextPath}/view?invid=${info.id}">查看回复</a>
                    &nbsp;||&nbsp;
                    <a href="javascript:void(0);" id="del"
                       onclick="del(${info.id})"
                    >删除</a>
                        <%--                    <input type="hidden" name="invid" value="${info.id}">--%>
                </td>
            </tr>
        </c:forEach>
        <tr id="msgTr">
            <td style="text-align: center;color: red" colspan="5">
                <script>
                    document.write(sessionStorage.getItem("msg"))
                </script>
            </td>
        </tr>
    </table>

    <div align="center">
        <input type="hidden" name="curPage" value=""/> <span>第${curPage}/${totalPageCount}页</span>
        <span> <a href="javascript:;" onclick="doPage(1)">首页</a> <a
                href="javascript:;" onclick="doPage(${curPage-1})">上页</a> <a
                href="javascript:;" onclick="doPage(${curPage+1})">下页</a> <a
                href="javascript:;" onclick="doPage(${totalPageCount})">末页</a> </span>
    </div>
</form>
</body>
</html>
