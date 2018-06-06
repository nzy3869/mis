package cn.wbull.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wbull.sys.dao.UserMapper;
import cn.wbull.sys.model.Role;
import cn.wbull.sys.model.User;
import cn.wbull.sys.model.UserExample;
import cn.wbull.sys.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> getAllUser() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public List<User> getUserWithLimit() {
		return null;
	}

	@Override
	public User getUserByName(String uname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUserByRole(Role role) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean userIsExist(String uname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addUser(User user) {
		
		return userMapper.insert(user);
	}

	@Override
	public int updateUSer(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> getUserBySearch(String params) {
		UserExample example = new UserExample();
		//example.or().andUidEqualTo(params);
		//example.or().andUnameEqualTo(params);
		example.or().andUidLike("%"+params+"%");
		example.or().andUnameLike("%"+params+"%");
		return userMapper.selectByExample(example);
	}

	@Override
	public int delUser(int id) {
		return userMapper.deleteByPrimaryKey(id);
	}

}
