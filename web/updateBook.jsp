<%--
  Created by IntelliJ IDEA.
  User: 何凯航
  Date: 2020/10/3
  Time: 22:27
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
                                    修改书籍
                                </small>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>



            <%--我们提交了修改查询失败，初步考虑是事务问题，配置完事务后仍然失败--%>
            <%--发现SQL修改未完成，原来是前端没有传id--%>
            <%--解决方法：前端传递隐藏域--%>
            <form action="${pageContext.request.contextPath}/book/UpdateBook" method="post">
                <input type="hidden" name="bookID" value="${QBook.bookID}">
                <div class="layui-form">
                    <label for="bkname">书籍名称：</label>
                    <input type="text" name="bookName" class="control-box" id="bkname" value="${QBook.bookName}" required>
                </div>
                <div class="layui-form">
                    <label >书籍数量：</label>
                    <input type="text" name="bookCounts" class="control-box" value="${QBook.bookCounts}" required>
                </div>
                <div class="layui-form">
                    <label >书籍描述：</label>
                    <input type="text" name="detail" class="control-box" value="${QBook.detail}" required>
                </div>
                <div class="layui-form">
                    <input type="submit" class="control-box" value="修改"   >
                </div>
            </form>


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

