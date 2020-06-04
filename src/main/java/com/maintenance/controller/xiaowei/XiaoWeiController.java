package com.maintenance.controller.xiaowei;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.maintenance.po.Database;
import com.maintenance.po.Model;
import com.maintenance.po.Page;
import com.maintenance.service.XiaoWeiService;

@Controller
@RequestMapping("xiaowei")
public class XiaoWeiController {

	@Autowired
	private XiaoWeiService xiaoWeiService;

	@RequestMapping("/maintanencepage")
	public ModelAndView maintanencepage(String id) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("xiaowei/modelmaintanencepage");

		modelAndView.addObject("id", id);

		return modelAndView;
	}

	@RequestMapping("/modellist")
	@ResponseBody
	public JSONObject modellist(String projectId) {

		System.out.println(projectId);

		JSONObject resultJson = new JSONObject();

		List<Model> modelList = xiaoWeiService.modellist(projectId);

		JSONArray array = new JSONArray();

		for (Model re : modelList) {
			array.add(JSONObject.toJSON(re));
		}

		resultJson.put("code", "1");
		resultJson.put("message", "成功");
		resultJson.put("data", array.toJSONString());

		return resultJson;
	}

	// @RequestMapping(value = "/addModel", method = { RequestMethod.POST }, consumes = "application/x-www-form-urlencoded;charset=UTF-8")
	@RequestMapping("/addModel")
	@ResponseBody
	public JSONObject addModel(@RequestBody Model model) {

		JSONObject resultJson = new JSONObject();

		int count = xiaoWeiService.addModel(model);

		resultJson.put("code", "1");
		resultJson.put("message", "成功");

		return resultJson;
	}

	@RequestMapping("/pagemaintanencepage")
	public ModelAndView pagemaintanencepage(Page page) {

		System.out.println(page.getModelId());

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("xiaowei/pagemaintanectpage");

		modelAndView.addObject("modelId", page.getModelId());

		return modelAndView;
	}

	@RequestMapping("/singlepage")
	public ModelAndView singlepage() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("xiaowei/singlepage");

		return modelAndView;
	}

	@RequestMapping("/dblist")
	@ResponseBody
	public JSONObject dblist(String projectId) {

		JSONObject resultJson = new JSONObject();

		List<Database> dblist = xiaoWeiService.dblist(projectId);
		JSONArray array = new JSONArray();
		for (Database db : dblist) {
			array.add(JSONObject.toJSON(db));
		}

		resultJson.put("code", "1");
		resultJson.put("message", "成功");
		resultJson.put("dblist", array.toJSONString());

		return resultJson;
	}

	@RequestMapping("/tblist")
	@ResponseBody
	public JSONObject tblist(String databaseId) {

		JSONObject resultJson = new JSONObject();

		Database database = xiaoWeiService.dbById(databaseId);

		String sql = "";
		// JsonArray array = DbUtil.runQueryRows(sql, database);

		// JSONArray array = new JSONArray();
		// for (Database tb : tblist) {
		// array.add(JSONObject.toJSON(tb));
		// }
		//
		// resultJson.put("code", "1");
		// resultJson.put("message", "成功");
		// resultJson.put("dblist", array.toJSONString());

		return resultJson;
	}

}
