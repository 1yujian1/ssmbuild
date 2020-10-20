<%--
  Created by IntelliJ IDEA.
  User: 何凯航
  Date: 2020/10/7
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>公告栏部分</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>

<%--<div class="layui-btn-group demoTable" style="margin-bottom: 10px;">
    <button  class="layui-btn" data-type="parseTable">立即转化为数据表格</button>
</div>

<table  lay-filter="parse-table-demo">
    <thead>
    <tr>
        <th lay-data="{field:'bul_id', width:100}"> ID </th>
        <th lay-data="{field:'admin_id', width:100}">用户名</th>
        <th lay-data="{field:'title', width:100}"> 标题</th>
        <th lay-data="{field:'time', width:100}">时间</th>
        <th lay-data="{field:'message', width:100}">内容</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="bulletin" items="${list}">
        <tr>
            <td>${bulletin.bul_id}</td>
            <td>${bulletin.admin_id}</td>
            <td>${bulletin.title}</td>
            <td>${bulletin.time}</td>
            <td>${bulletin.message}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.all.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    window.onload=layui.use('table', function(){
        var table = layui.table;

        var $ = layui.$, active = {
            parseTable: function(){
                table.init('parse-table-demo', { //转化静态表格
                    //height: 'full-500'
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>--%>
<%--<table  lay-filter="parse-table-demo">
    <thead>
    <tr>
        <th lay-data="{field:'bul_id', width:100}"> ID </th>
        <th lay-data="{field:'admin_id', width:100}">用户名</th>
        <th lay-data="{field:'title', width:100}"> 标题</th>
        <th lay-data="{field:'time', width:100}">时间</th>
        <th lay-data="{field:'message', width:100}">内容</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="bulletin" items="${list}">
        <tr>
            <td>${bulletin.bul_id}</td>
            <td>${bulletin.admin_id}</td>
            <td>${bulletin.title}</td>
            <td>${bulletin.time}</td>
            <td>${bulletin.message}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>--%>


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

<%--表内工具栏--%>
<script type="text/html" id="table_bar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            ,url: '${pageContext.request.contextPath}/bulletin/bulletinbyid' //数据接口
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
            ,defaultToolbar:['filter','exports','print',{//自定义头部工具栏图标
                title:'添加'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon:'layui-icon-add-1'
            }]
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
                {field: 'bul_id', title: 'id', sort: true, align:'center'}
                ,{field: 'title', title: '标题', sort: true, align:'center'}
                ,{field: 'time', title: '时间', sort: true, align:'center'}
                ,{field: 'admin_name', title: '发布人', align:'center'}
                ,{field: 'message', title: '内容', align:'center'}
                ,{field:'right', align:'center', toolbar: '#table_bar'}
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
                    url: '${pageContext.request.contextPath}/bulletin/bulletinbyid_title',//改接口
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
        //监听头部行工具事件
        table.on('toolbar(test)',function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.open({
                        type: 2,
                        area: ['400','400'],
                        maxmin:true,
                        content:'${pageContext.request.contextPath}/bulletin/toChild_add_bulletin'
                    });
                    layer.close(index);
            };
        })
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                //查看操作
                var index = layer.open({
                    content: data.message
                    ,title: data.title
                    ,area: ['400px', '350px'] //自定义文本域宽高
                    ,btn:['我知道了']
                    ,yes: function (index,layero) {
                        layer.close(index);
                    }
                });
            } else if(layEvent === 'del'){
                layer.confirm('确认删除该条公告？', function(index){

                    obj.del(); //删除对应行（tr）的DOM结构

                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/bulletin/delete_bul",//改数据接口
                        data:{id:data.bul_id},
                        success:function (data) {
                            if(data){
                                layer.msg("删除成功")
                            }else{
                                layer.msg("删除失败")
                            }
                        }
                    });
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.prompt({
                    formType: 2,
                    value: data.message,
                    title: '编辑操作',
                    area: ['400px', '350px'] //自定义文本域宽高
                }, function(value, index, elem){//写修改后提交事件
                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/bulletin/edit_bul",//改数据接口
                        data:{id:data.bul_id,msg:value},
                        success:function (data) {
                            if(data){
                                layer.msg("修改成功")
                            }else{
                                layer.msg("修改失败")
                            }
                            location.reload();
                        }
                    });
                    layer.close(index);
                });
            }
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
