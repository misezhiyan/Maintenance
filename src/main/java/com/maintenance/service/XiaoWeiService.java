package com.maintenance.service;

import java.util.List;

import com.maintenance.po.Model;

public interface XiaoWeiService {

	List<Model> modellist(String projectId);

	int addModel(Model model);

}
