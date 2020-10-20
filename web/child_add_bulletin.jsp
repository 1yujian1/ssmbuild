<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/13
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加公告</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>
<%--改action--%>
<form id="test" class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/bulletin/add_bul" method="post" height="100%" scrolling="yes" lay-filter="add_bulletin_form">
    <div class="layui-form-item">
        <label class="layui-form-label">时间</label>
        <div class="layui-input-block">
            <input type="text" name="time" required id="time" lay-verify="time" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发布人</label>
        <div class="layui-input-block">
            <input type="text" name="admin_name" required  lay-verify="admin_name" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" required   lay-verify="title" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">公告内容</label>
        <div class="layui-input-block">
            <textarea name="message" placeholder="请输入内容" class="layui-textarea"  required   lay-verify="message"></textarea>
        </div>
    </div>

    <button type="button" lay-submit   class="layui-btn layui-btn-fluid" lay-filter="add_bulletin_form" >提交</button>
</form>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script>
    layui.use(['form', 'layedit','laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        var laydate = layui.laydate;
        laydate.render({
            elem: '#time',// input里时间的Id
            type: 'datetime',
            value: new Date(),
            done: function (value, date) {
            }
        });
        form.render();
        form.val("add_bulletin_form",{

            "admin_name":"${account.name}"
        });
        form.on('submit(add_bulletin_form)', function(data){
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
    });




</script>

</body>
</html>
