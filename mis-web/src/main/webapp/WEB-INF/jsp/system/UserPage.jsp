<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入bootstrap样式 -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link
	href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css"
	rel="stylesheet">
<!-- jquery -->
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- bootstrap-table.min.js -->
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 工具容器 -->
	<div id="toolbar" class="btn-group" style="margin-left: 10px;">
		<button id="btn_add" type="button" class="btn btn-default"
			onclick="addVideoShow();">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
		<button id="btn_delete" type="button" class="btn btn-default"
			onclick="batchUploadShow();">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>批量上传
		</button>
		<button id="btn_edit" type="button" class="btn btn-default"
			onclick="editMemberInfoShow();">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>选择修改
		</button>
		<button id="btn_delete" type="button" class="btn btn-default"
			onclick="delMemberVideo();">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>选择删除
		</button>
	</div>


	<table id="table">
	</table>
</body>
<script type="text/javascript">
	$('#table')
			.bootstrapTable(
					{
						url : '${pageContext.request.contextPath }/user/getAllUser.do', //请求后台的url
						method : 'post',//请求方式
						showRefresh : true,
						dataField : "rows",//这是返回的json数组的key.默认好像是"rows".这里只有前后端约定好就行
						pagination : true,//底部分页条
						sidePagination : 'server',
						pageNumber : 1, //初始化加载第一页，默认第一页
						pageSize : 10, //每页的记录行数（*）
						pageList:[10,20,30,40],//分页步进值
						sortName : 'id',
						striped : true,//是否显示行间隔色
						cache : false,
						sortable : true,//是否启用排序
						showColumns:true,//显示内容列下拉框
						search:true,//启用搜索框
						searchOnEnterKey:true,//按下回车激活搜索
						sortOrder : 'asc',//排序方式
						uniqueId : 'id',//每一行的唯一标识，一般为主键列
						toolbar:'#toolbar',
						queryParams : function(params) {
							return {
								pageNum : params.offset,
								pageSize : params.limit, 
								search:params.search
								//sortName : params.sort,
								//sortOrder : params.order
							};
						},
						columns : [
								{
									field : 'ck',
									checkbox : true
								},
								{
									field : 'id',
									title : 'id',
									align : 'center',
									valign : 'middle'

								},
								{
									field : 'uid',
									title : '用户名',
									align : 'center',
									valign : 'middle'
								},
								{
									field : 'uname',
									title : '中文名',
									align : 'center',
									valign : 'middle'
								},
								{
									field : 'sex',
									title : '性别',
									align : 'center',
									valign : 'middle',
									formatter:function(value,rows,index){
										var text = '-';
										if(value==1){
											text = '男';
										}else if(value==0){
											text = '女';
										}
										return text;
									}
								},
								{
									field : 'tel',
									title : '电话',
									align : 'center',
									valign : 'middle'
								},
								{
									field : 'enabled',
									title : '启用状态',
									align : 'center',
									valign : 'middle',
									formatter:function(value,rows,index){
										var text = '-';
										if(value=="Y"){
											text = '有效';
										}else if(value=='N'){
											text = '无效';
										}
										return text;
									}
									
								},
								{
									field : 'createDate',
									title : '创建时间',
									align : 'center',
									valign : 'middle'
								},
								{
									field : 'remark',
									title : '备注',
									align : 'center',
									valign : 'middle'
								},
								{
									field : 'cz',
									title : '操作',
									align : 'center',
									valign : 'middle',
									formatter : function(value, rows, index) {
										var btn = '<button type="button" class="btn btn-primary">编辑</button>&nbsp&nbsp<button type="button" class="btn btn-danger">删除</button>';
										if(rows.enabled=='Y'){
											btn += '&nbsp&nbsp<button type="button" class="btn btn-warning">禁用</button>'
										}else if(rows.enabled=='N'){
											btn += '&nbsp&nbsp<button type="button" class="btn btn-success">启用</button>'
										}
										return btn;
									}

								} ],
						onLoadSuccess : function() {
							console.log("success");
						}
					});
</script>
</html>