package com.jc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.jc.dao.ISpecialtyDao;
import com.jc.dao.IUserLoginDao;
import com.jc.dto.Specialty;
import com.jc.dto.UserLogin;

public class RegAction extends Action {
	private IUserLoginDao userLoginDao;
	private ISpecialtyDao specialtyDao;

	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}

	public void setUserLoginDao(IUserLoginDao userLoginDao) {
		this.userLoginDao = userLoginDao;
	}

	/* Method execute */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserLogin userLogin = new UserLogin();
		userLogin.setType("2"); // �����û�����Ϊѧ��
		userLogin.setLoginName(request.getParameter("loginName"));
		userLogin.setPwd(request.getParameter("pwd"));
		userLogin.setMail(request.getParameter("mail"));
		if (!userLoginDao.findByLoginName(userLogin.getLoginName())) {
			System.out.println("�û��������ڿ���ע��");
			Integer id = userLoginDao.insert(userLogin); // �����Զ����ɵ�����
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("loginName",
					userLogin.getLoginName());
			// ���뵽��д������Ϣҳ��
			List<Specialty> list = specialtyDao.findStuByAll();
			request.setAttribute("list", list);
			return mapping.findForward("addStuInfo");
		} else {
			request.setAttribute("error", "�û����Ѿ����ڣ�������ע��");
			// ���ص�ע��ҳ��
			return mapping.findForward("reg");
		}
	}
}