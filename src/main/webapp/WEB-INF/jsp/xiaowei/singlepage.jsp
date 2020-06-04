<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>单表维护页面</title>
<link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/static/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/static/bootstrap/js/bootstrap.js"></script>
<%@ include file="../base/base.jsp"%>
</head>

<body>
	<div style="display: none">
		<input id="projectId" type="hidden" value="1">
	</div>

	<div>
		<label>选择要操作的库</label>
		<select id="database">
		</select>
		<br>

		<label>要操作的表</label>
		<div>
			<select id="table">
			</select>
			<input type="text" value="">
			<input type="button" value="查询操作表" onclick="queryTable()">
		</div>
		<br>

	</div>
</body>

<script type="text/javascript">
	$(function() {
		singleInfo();
	})

	function singleInfo() {

		$.post(webRoot + '/xiaowei/dblist', {
			projectId : $('#projectId').val()
		}, function(data) {
			//alert(data.code)

			$('#database').empty();

			var dblist = eval("(" + data.dblist + ")");
			for (var i = 0; i < dblist.length; i++) {
				var db = dblist[i];
				var option = $("<option>").val(db.id).text(db.name);
				$('#database').append(option);
			}
		}, 'json')
	}

	function queryTable() {

		var database = $('#database').val();

		$.post(webRoot + '/xiaowei/tblist', {
			databaseId : database
		}, function(data) {
			var tblist = eval("(" + data.tblist + ")");
			for (var i = 0; i < tblist.length; i++) {
				var tb = tblist[i];
				//var option = $("<option>").val(tb.id).text(tb.name);
				//$('#database').append(option);
			}
		}, 'json')
	}
</script>
</html>