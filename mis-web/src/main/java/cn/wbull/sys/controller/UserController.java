package cn.wbull.sys.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.wbull.sys.model.User;
import cn.wbull.sys.service.UserService;
import cn.wbull.util.PageUtil;
/**
 * 用户控制层
 * @author niuzy
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	/**
	 * 获取所有用户(分页功能)
	 * @param pageUtil 返回前端工具类
	 * @param pageSize 每页数据条数
	 * @param pageNum 数据页数
	 * @return ,@RequestParam(name="pageSize",defaultValue="10") int pageSize,@RequestParam(name="pageNum",defaultValue="0") int pageNum
	 */
	@RequestMapping("/getAllUser")
	@ResponseBody
	public PageUtil<List<User>> getAllUser(@RequestBody PageUtil pageUtil){
		PageHelper.startPage(pageUtil.getOffset(), pageUtil.getLimit(),true);
		List<User> allUser = null;																																																																				
		PageInfo<User> pageInfo = null;																																																																																																										
		if(pageUtil.getSearch()==null) {
			allUser = userService.getAllUser();																																																																																																														  								
		}else {
			allUser = userService.getUserBySearch(pageUtil.getSearch());
		}
		pageInfo = new PageInfo<>(allUser);
		List<User> list = pageInfo.getList();																															
		PageUtil<List<User>> pu = new PageUtil<List<User>>(pageUtil.getLimit(),pageUtil.getOffset(),pageUtil.getSearch(),pageUtil.getSort(),pageUtil.getOrder(),pageInfo.getTotal(), pageInfo.getPages(),list);
		return pu;
	}																	
	/**
	 * 前往用户管理页面
	 * @return
	 */
	@RequestMapping("/toUserManage")
	public String toUserManage() {
		return "system/UserPage";
	}
	/**
	 * 搜索数据
	 * @param params
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public PageUtil<List<User>> getUserBySearch(@RequestParam("search") String params){
		List<User> searchUser = userService.getUserBySearch(params);
		PageUtil p = new PageUtil<>();
		p.setRows(searchUser);
		return p;
	}
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUser(@RequestBody User user) {
		user.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		int result = userService.addUser(user);
		if(result==0) {
			return "error";
		}
		
		return "success";
	}
	
	/**
	 * 根据id删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping("/delUser")
	@ResponseBody
	public String delUser(@RequestParam("id") int id) {
		int result = userService.delUser(id);
		if(result==0) {
			return "error";
		}
		
		return "success";
	}
	@RequestMapping("/delMultUser")
	@ResponseBody
	public String delMultUser(@RequestBody int[] ids) {
		
		for (int i : ids) {
			System.out.println(i);
		}
		return null;
	}
	
}
