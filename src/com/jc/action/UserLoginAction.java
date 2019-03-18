package com.jc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.jc.dao.ISpecialtyDao;
import com.jc.dao.IStuUserDao;
import com.jc.dao.IUserLoginDao;
import com.jc.dto.Specialty;
import com.jc.dto.StuUser;
import com.jc.dto.UserLogin;

public class UserLoginAction extends Action {

	private IUserLoginDao userLoginDao;
	private IStuUserDao stuUserDao;
	private ISpecialtyDao specialtyDao;

	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}

	public void setStuUserDao(IStuUserDao stuUserDao) {
		this.stuUserDao = stuUserDao;
	}

	public void setUserLoginDao(IUserLoginDao userLoginDao) {
		this.userLoginDao = userLoginDao;
	}

	/* Method execute */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm userLoginForm = (DynaActionForm) form;
		UserLogin userLogin = userLoginDao.findbyNameAndPwd(
				userLoginForm.getString("loginName"),
				userLoginForm.getString("pwd"));
		if (userLogin == null) {
			request.setAttribute("error", "用户登录失败，用户名或密码不正确！");
			return mapping.findForward("index");
		} else {
			request.getSession().setAttribute("loginName",
					userLogin.getLoginName());
			request.getSession().setAttribute("id", userLogin.getId());
			if (userLogin.getType().equals("1")) {
				System.out.println("管理员登录");
				return mapping.findForward("manager");
			} else {
				// 判断学生有没有填写过基本信息
				StuUser stuUser = stuUserDao.findById(userLogin.getId());
				if (stuUser == null) {
					System.out.println("没添写过基础信息");
					List<Specialty> list = specialtyDao.findStuByAll();
					request.setAttribute("list", list);
					return mapping.findForward("addStuInfo");
				} else {
					Specialty specialty = specialtyDao.findById(stuUser
							.getSpecialtyId());
					request.setAttribute("specialty", specialty);
					request.setAttribute("stuUser", stuUser);
					System.out.println("添写过基础信息");
					return mapping.findForward("welcome");
				}
			}
		}
	}
}