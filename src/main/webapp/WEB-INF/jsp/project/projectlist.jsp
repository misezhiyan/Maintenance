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
		$('#addProjectArea').show();
	}
	function projectListArea() {
		$('#addProjectArea').hide();
		$('#projectListArea').empty();
		$('#projectListArea').show();
		showProjectList();
	}
	function showProjectList() {
		$.post(webRoot + "/project/projectlist", {}, function(data) {
	
			var projListContent = "<div>";
				
			var dataset = eval("("+data.data+")");
			for(var i = 0; i<dataset.length;i++){
				var proj = dataset[i];
				var projId = proj.id;
				var projectPath = proj.projectPath;
				var projectName = proj.projectName;
				
				projListContent += "<div>";
			/* projListContent += '<a href="' + webRoot + '/maintanence/pagelistpage?id='+projId+'" >'; */
				projListContent += '<a href="' + webRoot + '/xiaowei/maintanencepage?id='+projId+'" >';
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
</script>
</html>