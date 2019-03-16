package cn.ssm.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ssm.bean.User;
import cn.ssm.mapper.UserMapper;
import cn.ssm.service.UserService;
import cn.ssm.utils.Page;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	
	@Autowired(required=true)
	private UserMapper userMapper;
	
	
	@Override
	public User selectByCodeAndPwd(String userCode, String userPassword) throws Exception {
		User user = this.userMapper.selectByCodeAndPwd(userCode,userPassword);
		return user;
	}


	@Override
	public int deleteByPrimaryKey(Integer userId) throws Exception {
		return userMapper.deleteByPrimaryKey(userId);
	}


	@Override
	public int insert(User record) throws Exception {
		return userMapper.insertSelective(record);
	}


	@Override
	public int insertSelective(User record) throws Exception {
		
		return userMapper.insertSelective(record);
	}


	@Override
	public User selectByPrimaryKey(Integer userId) throws Exception {
		User user = userMapper.selectByPrimaryKey(userId);
		return user;
	}


	@Override
	public User selectByCode(String userCode) throws Exception {
		User user = userMapper.selectByCode(userCode);
		return user;
	}


	@Override
	public int updateByPrimaryKeySelective(User record) throws Exception {
		
		return userMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public int updateByPrimaryKey(User record) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Page<User> findUserList(Integer page, Integer rows, String userName, String userCode) throws Exception {
		User user = new User();
		user.setStart((page-1)*rows);
		user.setRows(rows);
		user.setUserCode(userCode);
		user.setUserName(userName);
		List<User> users = userMapper.selectUserList(user);
		Integer count = userMapper.selectUserListCount(user);
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}


	@Override
	public Page<User> findUserCustomerList(Integer page, Integer rows) {
		Integer start = (page-1)*rows;
		List<User> users = userMapper.selectUserCustomer(start, rows);
		Integer count = userMapper.selectUserCustomerCount();
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	
}
