package com.maintenance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.maintenance.po.Model;

@Mapper
public interface XiaoWeiMapper {

	List<Model> modellist(String projectId);

	int addModel(Model model);

}
