package cn.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.bean.User;

public interface UserMapper {
	
	List<User> selectUserCustomer(@Param("start")Integer start,@Param("rows")Integer rows);
	int selectUserCustomerCount();
	
	
	 List<User> selectUserList(User user);
	 Integer selectUserListCount(User user);
	
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

	User selectByCode(String userCode);
    
    User selectByCodeAndPwd(@Param("userCode")String userCode,@Param("userPassword")String userPassword);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}