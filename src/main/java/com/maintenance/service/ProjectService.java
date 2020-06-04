package com.maintenance.service;

import java.util.List;

import com.maintenance.po.Project;

public interface ProjectService {

	List<Project> projectlist();

	int addProject(Project project);

	Project getProjectById(String projectId);

}
