<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/13
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>公告栏</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test" lay-data="{height: 'full-200', cellMinWidth: 80, page: true, limit:30}"></table>
<%--表头工具栏--%>
<script type="text/html" id="toolbarDemo">
    <div class="demoTable ">
        <div class="layui-inline">
            <input class="layui-input" style="height:30px;width:157px;" name="get_title" id="get_title" lay-filter="get_title" placeholder="输入要查找的标题">
        </div>

        <button data-type="reload" class="layui-icon layui-icon-search" style="background:color(242,242,242);" lay-id="search_title" lay-filter="search_title"></button>
    </div>
</script>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>

<script>

    layui.use('table', function(){
        var table = layui.table;


        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 500
            ,url: '${pageContext.request.contextPath}/bulletin/allBulletin' //数据接口
            ,page:{
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                ,count: 19
                ,limit: 10
                ,limits:[10,20,30]
                ,groups: 5 //只显示 1 个连续页码
                ,first: false //不显示首页
                ,last: false //不显示尾页
            }
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar:['filter','exports','print']
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                var result;
                console.log(this);
                console.log(JSON.stringify(res));
                if (this.page.curr) {
                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                }
                else {
                    result = res.data.slice(0, this.limit);
                }
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": result //解析数据列表
                };
            }
            ,initSort:{
                field: 'time'//根据时间排序
                ,type: 'desc'//降序排序
            }
            ,sort: true
            ,cols: [[ //表头
                {field: 'title', title: '标题', sort: true, align:'center'}
                ,{field: 'time', title: '时间', sort: true, align:'center'}
                ,{field: 'admin_name', title: '发布人', align:'center'}
                ,{field: 'message', title: '内容', align:'center'}
            ]]
            ,id:'testReload'
            ,response:{
                statusCode: 0 //规定成功的状态码，默认：0
            }
        });
        //搜索标题
        var $ = layui.$, active = {
            reload: function(){
                var getTitle = $('#get_title');

                //执行重载
                table.reload('testReload', {
                    url: '${pageContext.request.contextPath}/bulletin/bulletinbytitle',//改接口
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        title: getTitle.val()
                    }
                }, 'data');
            }
        };
        $('body').on('click', '.demoTable .layui-icon', function(){//body不变, click内正常选择表和按钮
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>


<%--<table class="layui-table" lay-data="{height:315, url:'/bulletin/allBulletin', page:true, id:'test'}" lay-filter="test">
    <thead>
    <tr>
        <th lay-data="{field:'bul_id', width:80, sort: true}">ID</th>
        <th lay-data="{field:'admin_id', width:80}">用户名</th>
        <th lay-data="{field:'title', width:80, sort: true}">性别</th>
        <th lay-data="{field:'time'}">城市</th>
        <th lay-data="{field:'message'}">签名</th>
    </tr>
    </thead>
</table>--%>
</body>
</html>
