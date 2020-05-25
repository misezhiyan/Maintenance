package com.maintenance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maintenance.mapper.XiaoWeiMapper;
import com.maintenance.po.Model;
import com.maintenance.po.Project;
import com.maintenance.service.XiaoWeiService;

@Service("xiaoWeiService")
public class XiaoWeiServiceImpl implements XiaoWeiService {

	@Autowired
	private XiaoWeiMapper xiaoWeiMapper;

	@Override
	public List<Model> modellist(String projectId) {

		return xiaoWeiMapper.modellist(projectId);
	}

	@Override
	public int addModel(Model model) {

		return xiaoWeiMapper.addModel(model);
	}

	@Override
	public Project getProjectById(String projectId) {

		return xiaoWeiMapper.getProjectById(projectId);
	}

}
