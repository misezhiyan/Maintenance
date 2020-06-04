package com.maintenance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maintenance.mapper.ProjectMapper;
import com.maintenance.po.Project;
import com.maintenance.service.ProjectService;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectMapper projectMapper;

	@Override
	public List<Project> projectlist() {

		return projectMapper.projectlist();
	}

	@Override
	public int addProject(Project project) {

		return projectMapper.addProject(project);
	}

	@Override
	public Project getProjectById(String projectId) {

		return projectMapper.getProjectById(projectId);
	}
}
