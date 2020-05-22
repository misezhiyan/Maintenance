package com.maintenance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.maintenance.po.Project;

@Mapper
public interface ProjectMapper {

	List<Project> projectlist();

	int addProject(Project project);

}
