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
			data-toggle="modal" data-target="#myModal" ">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
		<button id="btn_delete" type="button" class="btn btn-default"
			onclick="delMultUsers();">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>选择删除
		</button>
	</div>

	<!-- ================================ table ====================================== -->
	<table id="table"></table>

	<!-- model -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<form  class="form-horizontal" id="addUserForm" method="post" action="${pageContext.request.contextPath }/user/addUser.do">
			<div class="modal-content ">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加用户</h4>
				</div>
				<!-- form body -start-  -->
				<div class="modal-body">
					
						<table
							style="width: 100%; text-align: center; border-collapse: separate; border-spacing: 0px 10px;">
							<tr>
								<td><label for="uid" class="control-label ">用户名</label></td>
								<td><input type="text" class="form-control" id="uid"
									name="uid" style="width: 70%" placeholder="请输入用户名" /></td>
							</tr>
							<tr>
								<td><label for="uname" class="control-label">中文名</label></td>
								<td><input type="text" class="form-control" id="uname"
									name="uname" style="width: 70%" placeholder="请输入中文名" /></td>
							</tr>
							<tr>
								<td><label for="password" class="control-label">中文名</label></td>
								<td><input type="password" class="form-control" id="password"
									name="password" style="width: 70%" placeholder="请输入密码" /></td>
							</tr>
							<tr>
								<td><label for="sex" class="control-label">性别</label></td>
								<td><input type="radio" name="sex" value="1" checked="checked">男</input>
									&nbsp&nbsp <input type="radio" name="sex" value="0">女</input>
									<!-- <select id="sex" name="sex" class="form-control">
									<option value="1" selected="selected">男</option>
									<option value="0">女</option>
								</select> --></td>
							</tr>

							<tr>
								<td><label for="tel" class="control-label">手机号码</label></td>
								<td><input type="text" class="form-control" id="tel"
									name="tel" style="width: 70%" placeholder="请输入手机号码" /></td>
							</tr>

							<tr>
								<td><label for="enabled" class="control-label">启用状态</label></td>
								<td><select id="enabled" name="enabled"
									class="form-control" style="width: 70%">
										<option value="Y" selected="selected">启用</option>
										<option value="N">禁用</option>
								</select></td>
							</tr>

							<tr>
								<td><label for="remark" class="control-label">备注</label></td>
								<td><textarea rows="5" cols="10" class="form-control"
										id="remark" name="remark" placeholder="请输入备注"
										style="width: 70%"></textarea></td>
							</tr>
						</table>
						<!-- form body -end-  -->
				
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onClick="addUser()">添加</button>
				</div>

			</div>

			<!-- /.modal-content -->
		</div>
		</form>
	<!-- /.modal -->
	</div>
</body>
<script type="text/javascript">
	//批量删除用户
	function delMultUsers(){
		var ids = [];
		//获取选中的元素
		var cks = $("#table").bootstrapTable('getSelections',function(rows){
			return rows.id;
		});
		//遍历元素并取出id
		for(j in cks) {
			 ids.push(cks[j].id);
		}
		console.log(ids);
		$.ajax({  
            type : "POST",  
            url : "${pageContext.request.contextPath}/user/delMultUser.do",  
            data : {
            	ids:JSON.stringify(ids), 
            },
            dataType : "json",  
            success:function(msg) {  
                alert(msg);
            },
            error:function(){
            	alert("服务器报错");
            }
        }); 
	}
	
	//根据id删除用户
	function delUser(id){
		$.ajax({  
            type : "POST",  
            url : "${pageContext.request.contextPath}/user/delUser.do",  
            data : {
            	id:id
            },
            dataType : "json",  
            success:function(msg) {  
                alert(msg);
            },
            error:function(){
            	alert("服务器报错");
            }
        }); 
	}
	//添加用户
	function addUser() {
		
		var formObject = {};
		var formArray = $("#addUserForm").serializeArray();
		$.each(formArray, function(i, item) {
			formObject[item.name] = item.value;
		});
		var formJson = JSON.stringify(formObject);
		//alert(formJson);
		$.ajax({  
            type : "POST",  
            url : "${pageContext.request.contextPath}/user/addUser.do",  
            data : formJson,  
            async:false, 
            contentType : "application/json",  
            dataType : "json",  
            success:function(msg) {  
				if(msg=="success"){
					alert("添加成功！");
				}else{
					alert("添加失败。");
				}
            	$('#myModal').modal('hide');
            },
            error:function(){
            	alert("服务器报错");
            }
        }); 
		
	}
	//表格初始化
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
						pageList : [ 10, 20],//分页步进值
						sortName : 'id',
						striped : true,//是否显示行间隔色
						cache : false,
						sortable : true,//是否启用排序
						showColumns : true,//显示内容列下拉框
						search : true,//启用搜索框
						searchOnEnterKey : true,//按下回车激活搜索
						sortOrder : 'asc',//排序方式
						//uniqueId : 'id',//每一行的唯一标识，一般为主键列
						toolbar : '#toolbar',
						queryParams : function(params) {
							return {
								pageNum : params.offset,
								pageSize : params.limit,
								search : params.search
							//sortName : params.sort,
							//sortOrder : params.order
							};
						},
						columns : [
								{
									field : 'ck',
									checkbox : true
									/* formatter : function(value, rows, index) {
										return rows.id;
									} */
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
									formatter : function(value, rows, index) {
										var text = '-';
										if (value == 1) {
											text = '男';
										} else if (value == 0) {
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
									formatter : function(value, rows, index) {
										var text = '-';
										if (value == "Y") {
											text = '有效';
										} else if (value == 'N') {
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
										var btn = '<button type="button" class="btn btn-primary" onclick="test('
												+ rows.id
												+ ')">编辑</button>&nbsp&nbsp<button type="button" class="btn btn-danger" onClick="delUser('+rows.id+')" >删除</button>';
										if (rows.enabled == 'Y') {
											btn += '&nbsp&nbsp<button type="button" class="btn btn-warning">禁用</button>'
										} else if (rows.enabled == 'N') {
											btn += '&nbsp&nbsp<button type="button" class="btn btn-success">启用</button>'
										}
										return btn;
									}

								} ],
						onLoadSuccess : function() {
							console.log("success");
						}
					});

	function test(params) {
		alert(params);
	}
</script>
</html>