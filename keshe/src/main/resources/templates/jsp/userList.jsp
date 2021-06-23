<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statis/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="test"></table>


<script src="${pageContext.request.contextPath}/statis/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            , done: function (res, curr, count) {
                // $("table").css("width", "100%");
                totalDeptData = res.data;
                // console.log(totalData)
                console.log(res.data)
            }
            ,url:'${pageContext.request.contextPath}/queryAllUser'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'username', width:80, title: '用户名',width:200}
                ,{field:'password', width:80, title: 'mima', sort: true,width:200}
                ,{field:'city', width:80, title: '城市'}
                ,{field:'sign', title: '签名', width: '30%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'experience', title: '积分', sort: true}
                ,{field:'score', title: '评分', sort: true}
                ,{field:'classify', title: '职业'}
                ,{field:'wealth', width:137, title: '财富', sort: true}
            ]]
        });
    });
</script>

</body>
</html>