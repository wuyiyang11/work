package cn.ssm.mapper;

import java.util.List;

import cn.ssm.bean.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer custId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer custId);
    
    List<Customer> selectCustomerList(Customer customer); 
    
    Integer selectCustomerListCount(Customer customer);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
}