package cn.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.ssm.bean.User;
import cn.ssm.service.UserService;
import cn.ssm.utils.Page;

@Controller
public class UserController {

	@Autowired(required=true)
	private UserService userService;
	
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public String login(String userCode,String userPassword,Model model,HttpSession session) throws Exception
	{
		User user = userService.selectByCodeAndPwd(userCode, userPassword);
		if(user!=null&&user.getUserState()==1)
		{
				session.setAttribute("user_session",user);
				return "index";	
		}
		model.addAttribute("msg","密码账号错误或者已被停用！");
		return "login";
	}
	
	@RequestMapping(value="/logOut.action")
	public String logOut(HttpSession session)
	{
		session.invalidate();
		return "redirect:login.action";
	}
	@RequestMapping(value="/login.action",method=RequestMethod.GET)
	public String toLogin()
	{
		return "login";
	}
	@RequestMapping(value="/userInfo.action")
	public void userInfo(Integer userId,Model model) throws Exception
	{
		User user = userService.selectByPrimaryKey(userId);
		model.addAttribute("userInfo",user);
	}
	@RequestMapping(value="/editUserInfo.action")
	public void editUserInfo(User user,Model model,String repassword) throws Exception
	{
		if(user.getUserPassword().equals(repassword))
		{
			int rows = userService.updateByPrimaryKeySelective(user);
			if(rows>0)
			{
				
				model.addAttribute("message","修改成功！");
			}	
			else
			{
				model.addAttribute("message","修改失败！");
			}
		}
		else
		{
			model.addAttribute("message2","密码不一致！");
		}
		
	}
	@RequestMapping(value="/selectUser.action")
	public ModelAndView selectUser(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows, String userName, String userCode,
			Model model) throws Exception
	{
		Page<User> user = userService.findUserList(page, rows, userName, userCode);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("page", user);
		modelAndView.setViewName("userList");

		return modelAndView;
	}
	@RequestMapping(value="/selectUserCustomer.action")
	public ModelAndView selectUserCustomer(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer rows,
			Model model) throws Exception
	{
		Page<User> user = userService.findUserCustomerList(page, rows);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("page", user);
		modelAndView.setViewName("ucLink");

		return modelAndView;
	}
	
	@RequestMapping(value="/userAdd.action")
	public String userAdd(User user,Model model) throws Exception
	{
		int rows = userService.insertSelective(user);
		if(rows>0)
		{
			model.addAttribute("message","添加成功！");
			return "userAdd";
		}
		else
		{
			model.addAttribute("message","添加失败！");
			return "userAdd";
		}
	}
	@RequestMapping(value="/userEdit.action")
	public void userEdit(Integer userId,Model model) throws Exception
	{
		User user = new User();
		user = userService.selectByPrimaryKey(userId);
		model.addAttribute("userInfo",user);
	}
	@RequestMapping(value="/updateUser.action")
	public String updateUser(User user,Model model) throws Exception
	{
		int rows = userService.updateByPrimaryKeySelective(user);
		if(rows>0)
		{
			
			model.addAttribute("message","修改成功！");
			return "userEdit";
		}	
		else
		{
			model.addAttribute("message","修改失败！");
			return "userEdit";
		}
	}
	@RequestMapping(value="/deleteUser.action")
	@ResponseBody
	public String deleteUser(Integer userId) throws Exception
	{
		int rows = userService.deleteByPrimaryKey(userId);
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
