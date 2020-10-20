<%--
  Created by IntelliJ IDEA.
  User: 何凯航
  Date: 2020/10/2
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部导航区域 -->
    <div class="layui-header layui-bg-cyan">
        <div class="layui-logo">CRM后台管理</div>
        <ul class="layui-nav layui-layout-right" lay-filter="personal_message">
            <li class="layui-nav-item">
                <dl id="bulletin_billboard">
                    <img src="${pageContext.request.contextPath}/img/billboard.png" class="layui-nav-img">公告栏&nbsp
                </dl>
            </li>
            <li class="layui-nav-item">
                <dl><img src="${pageContext.request.contextPath}/img/user.png" class="layui-nav-img">${account.name}</dl>
                <dl class="layui-nav-child">
                    <dd lay-id="personal_1"><a class="site-demo-active" data-url="${pageContext.request.contextPath}/account/toPerson" data-id="person_message" data-title="个人信息管理" datatype="tabAdd">修改信息</a></dd>
                    <dd lay-id="personal_2"><a id="changePWd">隐私设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/account/doLogOut"><i class="layui-icon layui-icon-logout"></i></a></li>

        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <!-- 侧边栏区域 -->
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><!--默认展开使用layui-nav-itemed-->
                    <a href="javascript:;">销售管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-title="销售计划" href="javascript:;">销售计划</a></dd>
                        <dd><a class="site-demo-active" data-title="销售预测" href="javascript:;">销售预测</a></dd>
                        <dd><a class="site-demo-active" data-title="销售绩效" href="javascript:;">销售绩效</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">销售统计</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">机会管理</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">销售分析</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/order/toaddorder" data-id="add_order" data-title="代下订单" datatype="tabAdd">代下订单</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">订单查询</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">订单统计</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">订单分析</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">客户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/company/tocompany" data-id="client_resource_manage" data-title="客户资源管理" datatype="tabAdd">客户资源管理</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户发展计划</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户价值管理</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户满意度管理</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户信誉管理</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户流失预警</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">客户关怀</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">服务管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/serve/toaddserver" data-id="add_serve" data-title="创建服务" datatype="tabAdd">创建服务</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">处理服务</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">服务反馈</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">服务归档</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">合同管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/contract/toaddcontract" data-id="add_contract" data-title="创建合同" datatype="tabAdd">创建合同</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">变更合同</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">审核合同</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">执行合同</a></dd>
                        <dd><a class="site-demo-active" href="javascript:;">合同归档</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计分析</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/company/tostatis" data-id="client_fenxi" data-title="客户构成分析" datatype="tabAdd">客户构成分析</a></dd>
<%--                        <dd><a class="site-demo-active" href="javascript:;">客户流失统计</a></dd>--%>
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/company/todevote" data-id="client_gongxian" data-title="客户贡献统计" datatype="tabAdd">客户贡献统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统设置</a>
                    <dl class="layui-nav-child">
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/account/tostruct" data-id="organizationg_struct" data-title="组织结构" datatype="tabAdd">组织结构</a></dd>
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/account/toEmployee" data-id="employee_management" data-title="员工管理" datatype="tabAdd">员工管理</a></dd>
                        <dd><a class="site-demo-active" data-url="${pageContext.request.contextPath}/bulletin/toAllBulletin" data-id="person_message" data-title="公告管理" datatype="tabAdd">公告管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" >

            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="project-sales">
                    公告管理
                </li>
            </ul>

            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show" >
                    <iframe data-title="公告管理" data-id="person_message"  src="${pageContext.request.contextPath}/bulletin/toAllBulletin" scrolling="no" frameborder="0"
                            width="100%" height="525px" ></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    html,body{ width:100%; height:100%;}
</style>
<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script>
    layui.use(['layer', 'element','jquery'], function(){
        var element = layui.element
            ,layer = layui.layer;
        var $ = layui.$;
        layer.msg('登陆成功');
        var active={
            tabAdd: function (url,id,name) {
                element.tabAdd('demo',{
                    title:name,
                    content:'<iframe data-frameid="'+id+'" scrolling="yes" frameborder="0" src="'+url+'" style="height:525px;width:100%;"></iframe>',
                    id:id
                })
                element.render('tab');
            },
            tabChange: function (id) {
                element.tabChange('demo',id);
            },
            tabDelete: function (id) {
                element.tabDelete("demo",id);
            },
            tabDeleteAll: function(ids){
                $.each(ids, function (i,item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };
        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function() {
            var dataid = $(this);
            if($(".layui-tab-title li[lay-id]").length<=0){
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            }else{
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        $('#changePWd').on('click',function () {
            layer.prompt({
                formType: 1,
                title: '修改密码(6-12位，且不能出现空格)',
                area: ['50px', '100px'] //自定义文本域宽高
            }, function(pass, index, elem){
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/account/updatePass",
                    data:{password:pass},
                    success:function (data) {
                        if(data){
                            layer.msg("修改成功")
                        }else{
                            layer.msg("修改失败")
                        }
                    }
                });
                layer.close(index);
            });
        })

        $('#bulletin_billboard').on('click',function () {
            layer.open({
                title:'公告栏',
                type: 2,
                area: ['808','565'],
                content: '${pageContext.request.contextPath}/bulletin/toChild_bulletin' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        })
    });


</script>
</body>
</html>