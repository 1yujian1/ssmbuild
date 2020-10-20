<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/14
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户资源管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>
<table id="employee_tab" lay-filter="test" lay-data="{height: 'full-200', cellMinWidth: 80, page: true, limit:30}"></table>

<script type="text/html" id="table_bar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbarDemo">
    <div class="demoTable ">
        <div class="layui-inline">
            <input class="layui-input" style="height:30px;width:157px;" name="get_name" id="get_name" lay-filter="get_name" placeholder="请输入企业名称">
        </div>

        <button data-type="reload" class="layui-icon layui-icon-search" style="background:color(242,242,242);" lay-id="search_name" lay-filter="search_name"></button>
    </div>
</script>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>

<script>

    layui.use('table', function(){
        var table = layui.table;


        //第一个实例
        table.render({
            elem: '#employee_tab'
            ,height: 500
            ,url: '${pageContext.request.contextPath}/company/allCompany' //数据接口
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar:['exports','print',{//自定义头部工具栏图标
                title:'添加'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon:'layui-icon-add-1'
            }]
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
            ,cols: [[ //表头
                {field: 'coname', title: '企业名称', sort: true, fixed: 'left', width:'10%'}
                ,{field: 'coadress', title: '企业地址', sort: true, width:'15%'}
                ,{field: 'cophone', title: '企业电话', width:'15%'}
                ,{field: 'csort', title: '类别', width:'10%'}
                ,{field: 'cname', title: '总经理', width:'15%'}
                ,{field: 'csex', title: '性别', width:'5%'}
                ,{field: 'cphone', title: '联系电话', width:'20%'}
                ,{field: 'cemail', title: 'email', width:'20%'}
                ,{field: 'remark', title: '备注', width:'20%'}
                ,{field:'right', align:'center', toolbar: '#table_bar', fixed: 'right', width:'10%',title:'操作'}
            ]]
            ,id:'testReload'

            ,response:{
                statusCode: 0 //规定成功的状态码，默认：0
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                var getName = $('#get_name');

                //执行重载
                table.reload('testReload', {
                    url: '${pageContext.request.contextPath}/company/CompanyByName',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        coname: getName.val()
                    }
                }, 'data');
            }
        };
        $('body').on('click', '.demoTable .layui-icon', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //头部行工具事件
        table.on('toolbar(test)',function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    var win = layer.open({
                        type:2
                        ,content:'${pageContext.request.contextPath}/company/toaddcompany'
                        ,maxmin:true
                        ,area:['500','400']
                        ,title:'企业添加'
                    });
                    layer.full(win);
                    layer.close(index);
            };
        })
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得当前行数据
            if(layEvent === 'del'){
                layer.confirm('确认删除该家企业信息？', function(index){

                    obj.del(); //删除对应行（tr）的DOM结构

                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath}/company/deleteCompany",
                        data:{coname:data.coname},
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
            }
        });
    });
</script>
</body>
</html>
