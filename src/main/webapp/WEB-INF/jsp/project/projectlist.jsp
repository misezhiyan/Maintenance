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
	<div id="sidebar" style="float: left; background-color: #CCC; height: 100%; width: 20%">
		<div>
			<a href="#" onclick="addProjectArea()">添加项目</a>
		</div>
		<div>
			<a href="#" onclick="projectListArea()">项目列表</a>
		</div>
		<br>
		<div>
			<a href="#" onclick="projectConfig()">项目配置</a>
		</div>
	</div>
	<div id="operationBody" style="float: right; background-color: #0A4; height: 100%; width: 80%; padding-bottom: 15px">
		<div id="projectListArea" style="display: none"></div>
		<div id="addProjectArea" style="display: none">
			<form id="addProjectForm" action="" method="post">
				<table>
					<thead>
						<tr>
							<th>项目名称</th>
							<th>项目路径</th>
						</tr>
					</thead>
					<tr>
						<td><input name="projectName" type="text"></td>
						<td><input name="projectPath" type="text"></td>
					</tr>
				</table>
				<input type="submit" onclick="addProject()">
			</form>
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
	/* $(function() {
		$.post(webRoot + " /project/projectlist", {}, function(data) {
			//alert(webRoot);
		})
	}) */

	function addProjectArea() {
		$('#projectListArea').hide();
		$('#projectConfig').hide();
		$('#addProjectArea').show();
	}
	function projectListArea() {
		$('#projectConfig').hide();
		$('#addProjectArea').hide();
		$('#projectListArea').empty();
		$('#projectListArea').show();
		showProjectList();
	}
	function showProjectList() {
		$.post(webRoot + "/project/projectlist", {}, function(data) {

			var projListContent = "<div>";

			var dataset = eval("(" + data.data + ")");
			for (var i = 0; i < dataset.length; i++) {
				var proj = dataset[i];
				var projId = proj.id;
				var projectPath = proj.projectPath;
				var projectName = proj.projectName;

				projListContent += "<div>";
				/* projListContent += '<a href="' + webRoot + '/maintanence/pagelistpage?id='+projId+'" >'; */
				projListContent += '<a href="' + webRoot + '/xiaowei/maintanencepage?id=' + projId + '" >';
				projListContent += projectName;
				projListContent += '</a>';
				projListContent += '</div>';
			}

			projListContent += "</div>";

			$('#projectListArea').append($(projListContent));

		}, 'json')

	}

	function addProject() {
		$('#addProjectForm').attr('action', webRoot + "/project/addProject");
		$('#addProjectForm').submit();
	}

	function projectConfig() {

		$('#projectListArea').hide();
		$('#addProjectArea').hide();
		$('#projectConfig').show();

		$.post(webRoot + '/project/projectconfig', {
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