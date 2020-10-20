
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>



<div id="secondPieChart" style="width:100%; height:450px;"></div>
<script type="text/javascript">

    function loadOneColumn() {
        var myChart = echarts.init(document.getElementById('secondPieChart'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            color: ['#ff7d27', '#47b73d', '#fcc36e', '#57a2fd', "#228b22"],//饼图颜色
            title: {
                text: '客户贡献组成',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: []
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'center',
                                max: 1548
                            }
                        }
                    },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            calculable: true,
            series: [{
                name: '发布排行',
                type: 'pie',
                radius: ['50%', '70%'],  //设置环形的空间大小
                itemStyle: {
                    normal: {
                        label: {
                            show: true
                        },
                        labelLine: {
                            show: false
                        }
                    },
                    emphasis: {
                        label: {
                            show: true,
                            position: 'center',
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names = [];    //类别数组（用于存放饼图的类别）
        var brower = [];
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/company/company_devote',//请求数据的地址
            dataType: "json",        //返回数据形式为json
            success: function (result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                $.each(result.list, function (index, item) {
                    names.push(item.department);    //挨个取出类别并填入类别数组
                    brower.push({
                        value: item.num,
                        name: item.department
                    });
                });
                myChart.hideLoading();    //隐藏加载动画
                myChart.setOption({        //加载数据图表
                    legend: {
                        data: names
                    },
                    series: [{
                        data: brower
                    }]
                });
            },
            error: function (errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    };
    loadOneColumn();
</script>


</body>
</html>
