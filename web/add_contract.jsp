<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/16
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建合同</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contract.css" media="all">
</head>
<body>

    <form id="test" class="layui-form" action="${pageContext.request.contextPath}/contract/addcontract" method="post" height="100%" scrolling="yes" lay-filter="add_contract_form">
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-md2 layui-col-lg-offset4">
                    <input type="text" name="scontract_name" required   lay-verify="contract_id" autocomplete="off" placeholder="请输入合同名称" class="layui-input" >
                </div>
                <div class="layui-col-md2">
                    <h2>采购合同</h2>
                </div>
            </div>
            <div class="layui-row">
                <div type="text" class="layui-col-md1 layui-col-md-offset9">
                    <label class="layui-form-label">合同编号:</label>
                </div>
                <div class="layui-col-md2">
                    <input type="text" name="scontract" required   lay-verify="contract_id" autocomplete="off" placeholder="请输入合同号" class="layui-input" >
                </div>
            </div>

        </div>
        <div>
            <label>   </label>
        </div>
        <div class="layui-form-item">
            <h3>
                <label class="layui-form-label">甲方:</label>
                <div class="layui-input-inline">
                        <select name="scompany" lay-verify="scompany" id="scompany" lay-filter="scompany"onchange="change_second"  lay-search>
                        <option value="">请选择对接公司</option>
                    </select>
                </div>
            </h3>
        </div>
        <div class="layui-form-item">
            <h3>
                <label class="layui-form-label">乙方:</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" value="天津市内浮顶制造公司" readonly>
                </div>
            </h3>
        </div>
        <div class="layui-form-item">
            <label>
                甲、乙双方经友好协商，就甲方向乙方采购内浮顶产品达成如下合作协议：<br/>
            </label>
            <br/><h3><b>第一条 合作意向</b></h3><br/>
                双方确认：自甲乙双方授权代表签字盖章之日起，甲方采购内浮顶产品作为乙方使用，乙方保证在合作期间按照本协议的承诺，实现对甲方的供货、调试、售后服务和技术支持。<br/>
            <br/><h3><b>第二条 合作方式</b></h3><br/>
                经甲、乙双方友好协商，确定基本的合作方式为：由甲方汇总其各区域分支机构的订购需求，并根据订单需求，提前向乙方指定帐户中打入货款，在乙方收到订单并确认货款到帐后，向所在的内浮顶销售公司指定人员提交订单。<br/>
            <br/><h3><b>第三条 产品及产品价格</b></h3><br/>
                1、甲方所采购的产品只能在甲方内部及各区域分支机构内使用，不得再转售给任何第三方。如有此情况，乙方有权立即终止向甲方供货，如对内浮顶公司的市场秩序造成负面影响，乙方将向内浮顶公司进行赔偿，赔偿损失由甲方补偿给乙方。<br/>
                2、甲乙双方约定的产品价格,如乙方整体产品市场价格发生变化超过5%以上，由乙方通过书面形式提出，经双方协商确定，按新价格进行供货结算。<br/>
            <br/><h3><b>第四条 付款方式</b></h3><br/>
                甲方在下订单同时将订单相同金额货款打入乙方指定帐户，如因甲方货款未到位导致的工程延误，乙方不承担任何责任。<br/>
                乙方指定账号如下：<br/>
                开 户 行：    天津银行营业部<br/>
                开户名称：   天津内浮顶有限公司<br/>
                账     号：  1234567890<br/>
            <br/><h3><b>第五条  订货及交货方式</b></h3><br/>
                1、甲方根据需要提前向乙方下达订单，并提前支付货款，货款到帐后，由乙方按照本协议约定的产品名称、数量、型号、价格、交货周期等向甲方提供产品、安装和售后服务。<br/>
                2、甲方的订单上必须包含但不限于单位的公章，否则乙方有权视其为无效订单，不予受理。<br/>
                3、乙方承诺在确认订单后 10 个工作日内完成货物的配送，如有其他特殊情况，亦可由甲乙双方另行协商交货时间。<br/>
                4、乙方根据订单在交货时间内将货物送到甲方指定收货地点，由甲方指定人员负责货物的签收、保管。货物经甲方人员签收后，如发生货物丢失等情况，由甲方承担损失。<br/>
                5、甲方应保证现场具备安装条件，否则造成组装延误及损失，乙方不承担责任。<br/>
                6、本合同项下货物的毁损、灭失风险自货物签收之日起由乙方转移到甲方。货物所有权在货款付清之日起由乙方转移到甲方。<br/>
                7、需要乙方为甲方提供安装服务的，甲方应当在接收货物时完成对货物数量及外包装可视部分进行清点和检查，并确保安装前货物状态正常，乙方人员负责安装调试，调试无问题后甲方应当在安装单上签字确认。<br/>
            <br/><h3><b>第六条 品质保证和保修服务</b></h3><br/>
                1、乙方通过内浮顶公司的统一服务窗口，依靠全国服务网络对甲方各分支机构进行服务。内浮顶公司在全国设立36个直属售后服务中心和 10000多家特约技术服务部统一向甲方提供售后服务。<br/>
                2、产品质量保修期从通过验收（验收期限为货到安装完毕后7日内）合格之日起算，在国家新三包基础上，甲方还将享受当期内浮顶最新的产品售后服务。<br/>
            <br/><h3><b>第七条  仲裁及适用法律</b></h3><br/>
            对本协议执行过程中发生的一切争议，双方应通过友好协商进行解决，若协商不能解决，则提交乙方所在地人民法院解决。<br/>
            <br/><h3><b>第八条  协议生效和变更</b></h3><br/>
            1、本协议经双方授权代表签字盖章后生效。<br/>
            2、协议经甲乙双方签订后，若有一方对本协议内容提出变更，必须书面向对方提出，经对方同意并书面确认后，双方签订补充协议。补充协议与本协议具有同等法律效力。<br/>
            附件为本合同不可分割的一部份，与本合同具同等法律效力。<br/>
            本协议未尽事宜，由双方友好协商解决。本协议的修改或补充，须采用书面形式，且须经过协议双方签章后生效。本协议一式<u>贰</u>份，甲方执<u>壹</u>份，乙方执<u>壹</u>份。<br/>

        </div>
        <button lay-submit type="button" class="layui-btn layui-btn-fluid" lay-filter="add_contract_form" value="提交审核">提交审核</button>
    </form>

    <script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script>
        layui.use(['form', 'layedit'], function(){
            var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit;

            <%--form.val("add_contract_form",{--%>
            <%--    "contract_id":"${contract.scontract}",--%>
            <%--    "contract_name":"${contract.scontract_name}", //对应的name--%>
            <%--});--%>
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




            form.on('submit(add_contract_form)', function(data){
                /*           console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                           console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                           console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}*/

                layer.confirm('确认提交?',{offset:'t'},function(index){
                    //do something
                    $("#test").submit();
                    layer.msg("提交成功")
                    layer.close(index);
                });

            });
            form.render();
            form.render('select');
        });

    </script>
</body>
</html>
