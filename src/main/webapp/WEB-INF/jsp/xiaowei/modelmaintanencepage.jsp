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
	</div>

	<div id="operationBody" style="float: right; background-color: #0A4; height: 100%; width: 80%; padding-bottom: 15px">
		<div id="modelListArea" style="display: none"></div>
		<div id="addModelArea" style="display: none">
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
	</div>
</body>
<script type="text/javascript">
	function addModelArea() {
		$('#modelListArea').hide();
		$('#addModelArea').show();
	}
	function modelListArea() {
		$('#addModelArea').hide();
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
</script>
</html>