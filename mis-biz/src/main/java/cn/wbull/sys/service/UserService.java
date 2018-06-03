package cn.wbull.sys.service;

import java.util.List;

import cn.wbull.sys.model.Role;
import cn.wbull.sys.model.User;

public interface UserService {
	/**
	 * 获取所有用户
	 * @return
	 */
	List<User> getAllUser();
	/**
	 * 分页查询用户
	 * @return
	 */
	List<User> getUserWithLimit();
	/**
	 * 通过用户名获取用户
	 * @param uname
	 * @return
	 */
	User getUserByName(String uname);
	/**
	 * 通过id获取用户
	 * @param id
	 * @return
	 */
	User getUserById(int id);
	/**
	 * 通过角色获取用户
	 * @param role
	 * @return
	 */
	List<User> getUserByRole(Role role);
	/**
	 * 根据用户名判断用户是否存在
	 * @return
	 */
	Boolean userIsExist(String uname);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	int addUser(User user);
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	int updateUSer(User user);
	/**
	 * 根据uid或中文名(uname)查询
	 * @param params
	 * @return
	 */
	List<User> getUserBySearch(String params);
}
