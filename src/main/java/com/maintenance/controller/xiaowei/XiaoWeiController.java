package com.maintenance.controller.xiaowei;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("xiaowei")
public class XiaoWeiController {

	@RequestMapping("/test")
	public String test() {

		System.out.println("test");

		return "hello";
	}
}
