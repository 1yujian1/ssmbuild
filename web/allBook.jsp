<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 何凯航
  Date: 2020/10/2
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>客户管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">客户管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">组织结构</a></li>
            <li class="layui-nav-item"><a href="">员工管理</a></li>
            <li class="layui-nav-item"><a href="">公告管理</a></li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">

                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>


    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">销售管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/book/allBook">销售计划</a></dd>
                        <dd><a href="javascript:;">销售预测</a></dd>
                        <dd><a href="javascript:;">销售绩效</a></dd>
                        <dd><a href="javascript:;">销售统计</a></dd>
                        <dd><a href="javascript:;">机会管理</a></dd>
                        <dd><a href="javascript:;">销售分析</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">代下订单</a></dd>
                        <dd><a href="javascript:;">订单查询</a></dd>
                        <dd><a href="javascript:;">订单统计与分析</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">客户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">客户资源管理</a></dd>
                        <dd><a href="javascript:;">客户发展计划</a></dd>
                        <dd><a href="javascript:;">客户价值管理</a></dd>
                        <dd><a href="javascript:;">客户满意度管理</a></dd>
                        <dd><a href="javascript:;">客户信誉管理</a></dd>
                        <dd><a href="javascript:;">客户流失预警</a></dd>
                        <dd><a href="javascript:;">客户关怀</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">服务管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">创建服务</a></dd>
                        <dd><a href="javascript:;">分配服务</a></dd>
                        <dd><a href="javascript:;">处理服务</a></dd>
                        <dd><a href="javascript:;">服务反馈</a></dd>
                        <dd><a href="javascript:;">服务归档</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">合同管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">创建合同</a></dd>
                        <dd><a href="javascript:;">变更合同</a></dd>
                        <dd><a href="javascript:;">审核合同</a></dd>
                        <dd><a href="javascript:;">执行合同</a></dd>
                        <dd><a href="javascript:;">合同归档</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计分析</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">客户构成统计</a></dd>
                        <dd><a href="javascript:;">客户流失统计</a></dd>
                        <dd><a href="javascript:;">客户贡献统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统设置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">组织结构</a></dd>
                        <dd><a href="javascript:;">员工管理</a></dd>
                        <dd><a href="javascript:;">公告管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-container">
                <div class="layui-row">
                    <div class="column-header">
                        <div class="layui-card-header">
                            <h1>
                                <small>
                                    书籍列表————————显示所有书籍
                                </small>
                            </h1>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md-offset4">
                        <%--toAddBook--%>
                        <a href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                            <a href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
                    </div>
                    <form action="${pageContext.request.contextPath}/book/queryBookByName" method="post">
                        <span style="color: red;font-weight: bold">${error}</span>
                        <input type=text name="queryBookName" placeholder="输入书籍名称查询" >
                        <input type="submit" class="control-box" value="查询">
                    </form>
                </div>
            </div>

                    <table class="layui-table layui-table-hover table">
                        <thead>
                            <tr>
                                <th>书籍编号</th>
                                <th>书籍名称</th>
                                <th>书籍数量</th>
                                <th>书籍详情</th>
                                <th>操作</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="book" items="${list}">
                                <tr>
                                    <td>${book.bookID}</td>
                                    <td>${book.bookName}</td>
                                    <td>${book.bookCounts}</td>
                                    <td>${book.detail}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/book/toUpdate?id=${book.bookID}">修改</a>
                                        &nbsp | &nbsp
                                        <a href="${pageContext.request.contextPath}/book/DeleteBook/${book.bookID}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

        </div>
    </div>

    <%--  <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
      </div>--%>
</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</html>

