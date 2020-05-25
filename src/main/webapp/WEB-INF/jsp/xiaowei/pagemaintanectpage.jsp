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
	<input id="modelId" type="hidden" value="${modelId }">
	<div id="sidebar" style="float: left; background-color: #CCC; height: 100%; width: 20%">
		<div id="showArea">
			<div>
				<a href="#">页面列表</a>
				<div id="pagelist"></div>
			</div>
			<div>
				<a href="#">交易列表</a>
				<div id="tradlist"></div>
			</div>
		</div>

		<div id="addArea" style="margin-top: 20px">
			<div>
				<a href="#" onclick="addPage()">添加页面</a>
			</div>
			<div>
				<a href="#" onclick="addTrad()">添加交易</a>
			</div>
		</div>
	</div>

	<div id="operationBody" style="float: right; background-color: #AA4; height: 100%; width: 80%; padding-bottom: 15px">
		<div id="pageAddArea" name="addArea" style="display: none">
			<div id='pageConfig' style="display: none">
				<label>页面配置</label>
				<br>
				<label>页面类型</label>
				<select name="pageType">
					<option value='single'>单表页面</option>
				</select>
				<br>
				<input type="button" value="确认页面配置" onclick="confirmPageConfig()">
			</div>
			<div id='pageOperation' style="display: none">
				<div id="single" name="page" style="display: none">
					<div>单表页面</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addPage() {
		$('#operationBody').find('div[name=addArea]').hide();
		$('#pageAddArea').show();
		$('#pageConfig').show();
	}

	function confirmPageConfig() {
		var pageType = $('#pageConfig').find('[name=pageType]').val();
		$('#pageConfig').hide();
		$('#pageOperation').show();
		$('#pageOperation').find('[name=page]').hide();
		$('#pageOperation').find('#' + pageType).show();
	}
</script>
</html>