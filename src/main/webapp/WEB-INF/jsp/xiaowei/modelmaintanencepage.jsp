<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>项目维护页面</title>
<link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/static/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/static/bootstrap/js/bootstrap.js"></script>
<%@ include file="../base/base.jsp"%>
</head>

<body>
	<input id="projectId" type="hidden" value="${id }">
	<div id="sidebar" style="float: left; background-color: #CCC; height: 100%; width: 20%">
		<div>
			<a href="#" onclick="addModelArea()">添加模块</a>
		</div>
		<div>
			<a href="#" onclick="modelListArea()">模块列表</a>
		</div>
		<br>
		<div>
			<a href="#" onclick="projectConfig()">项目配置</a>
		</div>
	</div>

	<div id="operationBody" style="float: right; background-color: #0A4; height: 100%; width: 80%; padding-bottom: 15px">
		<div id="modelListArea" name="operationArea" style="display: none"></div>
		<div id="addModelArea" name="operationArea" style="display: none">
			<div>
				<table>
					<thead>
						<tr>
							<th>模块名称</th>
							<th>模块地址</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="modelName"></td>
							<td><input name="modelPath"></td>
						</tr>
					</tbody>
				</table>
				<input type="button" value="添加" onclick="addModel()">
			</div>
		</div>
		<div id="projectConfig" name="operationArea" style="display: none">
			<label>项目路径</label>
			<input name="projectPath">
			<input type="button" value="编辑" onclick="editProjPath()">
			<input type="button" value="保存" onclick="saveProjPath()">
			<div>
				<label>数据库配置</label>
				<div id="dbEditList" style="display: none">
					<table>
						<thead>
							<tr>
								<th>数据库类型</th>
								<th>数据库名称</th>
								<th>IP</th>
								<th>端口</th>
								<th>SCHEMA(db2专有)</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><select name="dbType">
										<option value="db2">db2</option>
									</select></td>
								<td><input type="text" name="dbName"></td>
								<td><input type="text" name="dbName"></td>
								<td><input type="text" name="port"></td>
								<td><input type="text" name="schema"></td>
								<td><a href="#">编辑</a><a href="#">保存</a><a href="#">删除</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="dbAdd" style="display: none">
					<table>
						<thead>
							<tr>
								<th>数据库类型</th>
								<th>数据库名称</th>
								<th>IP</th>
								<th>端口</th>
								<th>SCHEMA(db2专有)</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><select name="dbType">
										<option value="db2">db2</option>
									</select></td>
								<td><input type="text" name="dbName"></td>
								<td><input type="text" name="dbName"></td>
								<td><input type="text" name="port"></td>
								<td><input type="text" name="schema"></td>
								<td><a href="#">编辑</a><a href="#">保存</a><a href="#">删除</a></td>
							</tr>
						</tbody>
					</table>
					<input type="button" value="保存" onclick="saveDbAdd()">
					<input type="button" value="取消" onclick="cancelDbAdd()">
				</div>
				<input type="button" value="添加数据库配置">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addModelArea() {
		$('#operationBody').find('[name=operationArea]').hide();
		$('#addModelArea').show();
	}
	function modelListArea() {
		$('#operationBody').find('[name=operationArea]').hide();
		$('#modelListArea').empty();
		$('#modelListArea').show();
		showModelList();
	}

	function addModel() {

		var projectId = $('#projectId').val();
		var modelName = $('#addModelArea').find('input[name=modelName]').val();
		var modelPath = $('#addModelArea').find('input[name=modelPath]').val();

		$.ajax({
			url : webRoot + '/xiaowei/addModel',
			data : JSON.stringify({
				'projectId' : projectId,
				'modelName' : modelName,
				'modelPath' : modelPath
			}),
			dataType : 'json',
			type : 'POST',
			contentType : "application/json;",
			async : false,
			success : function(data) {
				alert('success')
				alert(data);
				alert(data.message);
			},
			error : function(data) {
				alert('error')
				alert(data);
				alert(data.message);
			}
		})

		/* var dataJson = {
			'projectId' : projectId,
			'modelName' : modelName,
			'modelPath' : modelPath
		};
		alert(JSON.stringify(dataJson));
		//return;

		$.post(webRoot + '/xiaowei/addModel', JSON.stringify(dataJson), function(data) {
			alert(data.message);
		}, 'json') */
	}

	function showModelList() {
		var projectId = $('#projectId').val();
		$.post(webRoot + "/xiaowei/modellist", {
			'projectId' : projectId
		}, function(data) {
			//alert(data.message);

			var modelListNode = $('<div><div>');
			var array = eval("(" + data.data + ")");
			for (var i = 0; i < array.length; i++) {
				var model = array[i];
				$(modelListNode).append($('<a href="' + webRoot + '/xiaowei/pagemaintanencepage?modelId=' + model.id + '">' + model.modelName + '</a>'));
				$(modelListNode).append($('<br>'));
			}
			$('#modelListArea').append(modelListNode);
		}, 'json')
	}

	function projectConfig() {

		$('#operationBody').find('[name=operationArea]').hide();
		$('#projectConfig').show();

		$.post(webRoot + '/xiaowei/projectconfig', {
			'projectId' : projectId
		}, function(data) {
			alert(data.code);
		})
	}

	function saveDbAdd() {

	}

	function cancelDbAdd() {
		$('#dbAdd').hide();
	}
</script>
</html>