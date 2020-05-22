package com.maintenance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.maintenance.po.Project;
import com.maintenance.service.ProjectService;

@Controller
@RequestMapping("project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	/**
	 * POST获取参数
	 */
	@RequestMapping("/test")
	public String test() {

		return "hello";
	}

	// /**
	// * GET获取参数
	// */
	// @RequestMapping("/test1")
	// public String test1(Test test) {
	//
	// System.out.println(test.getTest());
	//
	// return "hello";
	// }

	@RequestMapping("/project")
	public String project() {

		return "project/project";
	}

	@RequestMapping("/projectlistpage")
	public String projectlistpage() {

		return "project/projectlist";
	}

	@RequestMapping("/addProject")
	public String addProject(Project project) {

		projectService.addProject(project);

		return "project/projectlist";
	}

	@RequestMapping("/projectlist")
	@ResponseBody
	public String projectlist() {

		JSONObject resultJson = new JSONObject();

		JSONArray array = new JSONArray();

		List<Project> list = projectService.projectlist();
		for (Project re : list) {
			System.out.println(re.getProjectName());
			array.add(JSONObject.toJSON(re));
		}

		resultJson.put("code", "1");// 成功
		resultJson.put("message", "成功");// 成功

		resultJson.put("data", array.toJSONString());

		return resultJson.toJSONString();
	}
}
