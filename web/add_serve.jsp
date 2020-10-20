<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/14
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建服务</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>新建服务</legend>
</fieldset>

<form  id="test" class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/serve/addserver" method="post" height="100%" scrolling="yes" lay-filter="add_serve_form">
    <div class="layui-form-item">
        <label class="layui-form-label">服务名称</label>
        <div class="layui-input-block">
            <input type="text" name="serve_title" required placeholder="请输入服务名称"  lay-verify="serve_title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="serve_creator" required  lay-verify="serve_creator" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <%--    下拉选框--%>
    <div class="layui-form-item">
        <label class="layui-form-label">对接企业</label>
        <div class="layui-input-block">
            <select name="scompany" lay-verify="scompany" id="scompany" lay-filter="scompany"onchange="change_second" lay-search>
                <option value="">请选择对接公司</option>
            </select>
        </div>
    </div>
<%--    下拉选框--%>
    <div class="layui-form-item">
        <label class="layui-form-label">业务员</label>
        <div class="layui-input-block" >
            <select  name="sserver" lay-verify="sserver" id="sserver" lay-filter="sserver" lay-search>
                <option value="">请选择一个业务员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="serve_content" placeholder="请输入内容" class="layui-textarea" style="height:150px"></textarea>
        </div>
    </div>
    <button lay-submit type="button" class="layui-btn layui-btn-fluid" lay-filter="add_serve_form" >提交</button>
</form>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script>
    layui.use(['form', 'layedit'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
        ;

        form.val("add_serve_form",{
            "serve_creator":"${account.name}", //对应的name
        });
        //给下拉选框动态赋值

        $.ajax({
            url: '${pageContext.request.contextPath}/company/allCompany',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                //使用循环遍历，给下拉列表赋值
                $.each(data.data, function (index, value) {
                    console.log(value.coname);
                    //这个里面的参数说明 第一个是显示的文本，第二个是value值
                    //例如：new Option(item.xm, item.id)第一个参数是下拉列表中显示的值  第二个参数是选中传递给后台的值
                    $('#scompany').append(new Option(value.coname,value.coname));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }
        });

        form.on('select(scompany)',function(data){
            //给下拉选框动态赋值
            var coname = data.value;
            $.ajax({
                url: '${pageContext.request.contextPath}/account/employeebydepart',
                dataType: 'json',
                type: 'get',
                data:{"coname":coname},
                success: function (data) {
                    $("#sserver").empty();
                    console.log(data);
                    //使用循环遍历，给下拉列表赋值
                    $.each(data.data, function (index, value) {
                        console.log(value.name);
                        //这个里面的参数说明 第一个是显示的文本，第二个是value值
                        //例如：new Option(item.xm, item.id)第一个参数是下拉列表中显示的值  第二个参数是选中传递给后台的值
                        $('#sserver').append(new Option(value.name,value.id));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
        });




        form.on('submit(add_serve_form)', function(data){
            /*           console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                       console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                       console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}*/

            layer.confirm('确认提交?', function(index){
                //do something
                $("#test").submit();
                layer.msg("提交成功")
                layer.close(index);
            });

        });
        form.render();
    });

</script>
</body>
</html>
