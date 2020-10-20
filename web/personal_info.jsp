<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/10
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息管理部分</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>个人信息</legend>
</fieldset>
<form id="test" class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/account/UpdatePerson" method="post" height="100%" scrolling="yes" lay-filter="personal_info_form">
    <div class="layui-form-item">
        <label class="layui-form-label">工号</label>
        <div class="layui-input-block">
            <input type="text" name="id" required  lay-verify="id" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-block">
            <input type="text" name="department" required  lay-verify="department" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" required   lay-verify="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked>
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone" required  lay-verify="phone" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">email</label>
        <div class="layui-input-block">
            <input type="text" name="email" required  lay-verify="email" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">家庭住址</label>
        <div class="layui-input-block">
            <input type="text" name="address" required  lay-verify="address" autocomplete="off" class="layui-input">
        </div>
    </div>
    <button type="submit" class="layui-btn layui-btn-fluid" lay-filter="demo1" onclick="sub()">提交</button>
</form>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        form.render();
        form.val("personal_info_form",{
            "name":"${account.name}", //对应的name
            "id":"${account.id}",
            "department":"${account.department}",
            "sex":"${account.sex}",
            "phone":"${account.phone}",
            "email":"${account.email}",
            "address":"${account.address}"
        });
        form.on('submit(demo1)', function(data){
            /*           console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                       console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                       console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}*/


                //do something

            layer.confirm('确认提交?', function(index){
                //do something
                $("#demo1").submit();
                layer.close(index);
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });


        function sub() {
            var res=confirm('确认要提交')
            if(res){
                document.getElementById("test").onsubmit;
                alert('提交成功');
            }
        }

</script>



</body>
</html>

<%--form.on('submit(submit_per_msg)', function(data){--%>
<%--     layer.confirm('您确认要提交吗？', {--%>
<%--         btn: ['确认','取消'] //按钮--%>
<%--     }, function(index,layero){--%>
<%--         $("#submit_per_msg").submit();--%>
<%--         layer.close(index);--%>
<%--     }, function(){--%>
<%--         layer.msg('已取消');--%>
<%--         return false;--%>
<%--     });--%>
<%--     return false;--%>
<%-- });--%>