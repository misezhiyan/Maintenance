package com.maintenance.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.maintenance.po.Database;
import com.maintenance.util.dbutil.Db2Factory;

public class DbUtil {

	public static JSONArray runQueryRows(String sql, Database database) throws Exception {

		JSONArray array = new JSONArray();

		Connection connection = null;

		String type = database.getType();
		if ("db2".equals(type)) {
			connection = Db2Factory.getConnection(database);
		}

		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;

		System.out.println("执行SQL:" + sql);

		prepareStatement = connection.prepareStatement(sql);
		resultSet = prepareStatement.executeQuery();

		try {
			List<String> colNames = new ArrayList<String>();
			ResultSetMetaData metaData = resultSet.getMetaData();
			for (int i = 1; i < metaData.getColumnCount() + 1; i++) {
				String colName = metaData.getColumnName(i);
				colNames.add(colName);
			}
			while (resultSet.next()) {
				JSONObject resJson = new JSONObject();

				for (int i = 0; i < colNames.size(); i++) {
					String colName = colNames.get(i);
					resJson.put(colName, resultSet.getObject(colName));
				}

				array.add(resJson);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("执行查询异常");
		} finally {

			if (null != resultSet) {
				try {
					resultSet.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (null != prepareStatement) {
				try {
					prepareStatement.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (null != connection) {
				try {
					connection.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}

		return array;
	}

	public static void main(String[] args) throws Exception {

		Database database = new Database();
		database.setIp("123.57.21.108");
		database.setPort("50000");
		database.setDbname("ZRGBK");
		database.setUser("imsc");
		database.setPassword("nxu803BWZ*#@Suw261");
		database.setType("db2");

		String sql = "SELECT CURRENT timestamp as times FROM \"SYSIBM\".SYSDUMMY1";

		JSONArray runQueryRows = runQueryRows(sql, database);

		System.out.println(runQueryRows.size());
		System.out.println(runQueryRows.toJSONString());
		System.out.println(runQueryRows.toString(features));
	}
}
