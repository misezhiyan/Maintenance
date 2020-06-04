package com.maintenance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.maintenance.po.Database;
import com.maintenance.po.Model;

@Mapper
public interface XiaoWeiMapper {

	List<Model> modellist(String projectId);

	int addModel(Model model);

	List<Database> dblist(@Param("projectId") String projectId);

	Database dbById(@Param("databaseId") String databaseId);

}
