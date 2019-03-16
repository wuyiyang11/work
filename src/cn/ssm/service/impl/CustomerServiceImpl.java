package cn.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ssm.bean.Customer;
import cn.ssm.mapper.CustomerMapper;
import cn.ssm.service.CustomerService;
import cn.ssm.utils.Page;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired(required=true)
	private CustomerMapper customerMapper;
	@Override
	public Page<Customer> findCustomerList(Integer page, Integer rows, String custName, String startTime,
			String endTime) throws Exception {
		Customer customer = new Customer();
		customer.setStart((page-1)*rows);
		customer.setRows(rows);
		customer.setCustName(custName);
		customer.setStartTime(startTime);
		customer.setEndTime(endTime);
		List<Customer> customers = customerMapper.selectCustomerList(customer);
		for(Customer customerList:customers)
		{
			if(customerList.getCustLevel().equals("guest"))
			{
				customerList.setCustLevel("∆’Õ®");
			}
		}
		Integer count = customerMapper.selectCustomerListCount(customer);
		Page<Customer> result = new Page<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	@Override
	public int createCustomer(Customer customer) throws Exception {
		return customerMapper.insertSelective(customer);
	}
	@Override
	public Customer selectByPrimaryKey(Integer custId) throws Exception {
		return customerMapper.selectByPrimaryKey(custId);
	}
	@Override
	public int updateByPrimaryKeySelective(Customer record) throws Exception {
		
		return customerMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public int deleteByPrimaryKey(Integer custId) throws Exception {
		
		return customerMapper.deleteByPrimaryKey(custId);
	}

}
