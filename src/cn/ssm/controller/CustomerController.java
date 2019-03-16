package cn.ssm.controller;



import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.ssm.bean.Customer;
import cn.ssm.bean.User;
import cn.ssm.service.CustomerService;
import cn.ssm.utils.Page;

@Controller
public class CustomerController {

	@Autowired(required=true)
	private CustomerService customerService;
	@RequestMapping(value="/selectCustomer.action")
	public ModelAndView selectCustomer(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,String custName,String startTime,String endTime,
			Model model) throws Exception
	{
		String startTime1 = startTime;
		String endTime1 = endTime;
		if(startTime!=null&&startTime!="")
		{
			startTime1 +=" 0:0:0";
		}
		else
		{
			startTime1=null;
		}
		if(endTime!=null&&endTime!="")
		{
			endTime1 +=" 23:59:59";
		}
		else
		{
			endTime1=null;
		}
		if(custName=="")
		{
			custName=null;
		}
		Page<Customer> customerVo = customerService.findCustomerList(page, rows, custName, startTime1, endTime1);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("page", customerVo);
		modelAndView.setViewName("memberList");

		return modelAndView;
	}
	
	@RequestMapping(value="/memberAdd.action")
	public String memberAdd(Customer customer,HttpSession session,Model model) throws Exception
	{
		User user = (User) session.getAttribute("user_session");
		customer.setCustUserId(user.getUserId());
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		customer.setCustCreatetime(timeStamp);
		int rows  = customerService.createCustomer(customer);
		if(rows>0)
		{
			model.addAttribute("message","添加成功！");
			return "memberAdd";
		}	
		else
		{
			model.addAttribute("message","添加失败！");
			return "memberAdd";
		}
	}
	@RequestMapping(value="/memberEdit.action")
	public void memberEdit(Integer custId,Model model) throws Exception
	{
		Customer customer = new Customer();
		customer = customerService.selectByPrimaryKey(custId);
		model.addAttribute("customerInfo",customer);
	}
	@RequestMapping(value="/updateCustomer.action")
	public String updateCustomer(Customer customer,Model model) throws Exception
	{
		int rows = customerService.updateByPrimaryKeySelective(customer);
		if(rows>0)
		{
			
			model.addAttribute("message","修改成功！");
			return "memberEdit";
		}	
		else
		{
			model.addAttribute("message","修改失败！");
			return "memberEdit";
		}
	}
	@RequestMapping(value="/deleteCustomer.action")
	@ResponseBody
	public String deleteCustomer(Integer custId) throws Exception
	{
		int rows = customerService.deleteByPrimaryKey(custId);
		if(rows>0)
		{
			return "OK";
		}
		else
		{
			return "FALL";
		}
	}
}
