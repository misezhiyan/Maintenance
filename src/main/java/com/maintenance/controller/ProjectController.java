package com.maintenance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maintenance.service.ProjectService;

@Controller
@RequestMapping("project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@RequestMapping("/projectlist")
	public String test() {

		List<String> list = projectService.projectlist();
		for (String re : list) {
			System.out.println(re);
		}

		return "hello";
	}
}
