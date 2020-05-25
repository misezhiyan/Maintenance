package com.maintenance.service;

import java.util.List;

import com.maintenance.po.Model;
import com.maintenance.po.Project;

public interface XiaoWeiService {

	List<Model> modellist(String projectId);

	int addModel(Model model);

	Project getProjectById(String projectId);

}
