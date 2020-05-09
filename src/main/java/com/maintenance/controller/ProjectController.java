package com.maintenance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maintenance.po.Test;
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

	/**
	 * GET获取参数
	 */
	@RequestMapping("/test1")
	public String test1(Test test) {

		System.out.println(test.getTest());

		return "hello";
	}

	@RequestMapping("/projectlist")
	public String projectlist() {

		List<String> list = projectService.projectlist();
		for (String re : list) {
			System.out.println(re);
		}

		return "hello";
	}
}
