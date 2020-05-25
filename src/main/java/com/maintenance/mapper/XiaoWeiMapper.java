package com.maintenance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.maintenance.po.Model;
import com.maintenance.po.Project;

@Mapper
public interface XiaoWeiMapper {

	List<Model> modellist(String projectId);

	int addModel(Model model);

	Project getProjectById(@Param("projectId") String projectId);

}
