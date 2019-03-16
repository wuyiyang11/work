package cn.ssm.service;


import org.apache.ibatis.annotations.Param;

import cn.ssm.bean.User;
import cn.ssm.utils.Page;

public interface UserService {
	
	public Page<User> findUserCustomerList(Integer page,Integer rows)throws Exception;
	public Page<User> findUserList(Integer page,Integer rows,
			String userName,String userCode)throws Exception;

	public int deleteByPrimaryKey(Integer userId)throws Exception;

	public int insert(User record)throws Exception;

	public int insertSelective(User record)throws Exception;

	public User selectByPrimaryKey(Integer userId)throws Exception;

	public User selectByCode(String userCode)throws Exception;
    
	public User selectByCodeAndPwd(@Param("userCode")String userCode,@Param("userPassword")String userPassword) throws Exception;

	public int updateByPrimaryKeySelective(User record)throws Exception;

	public int updateByPrimaryKey(User record)throws Exception;
}
