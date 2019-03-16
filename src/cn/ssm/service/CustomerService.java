package cn.ssm.service;

import cn.ssm.bean.Customer;
import cn.ssm.utils.Page;

public interface CustomerService {

	public Page<Customer> findCustomerList(Integer page,Integer rows,
			String custName,String startTime,String endTime)throws Exception; 
	public int createCustomer(Customer customer)throws Exception;
	
	public Customer selectByPrimaryKey(Integer custId)throws Exception;
	
	public int updateByPrimaryKeySelective(Customer record)throws Exception;
	
	public int deleteByPrimaryKey(Integer custId)throws Exception;
}
