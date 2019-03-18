package com.jc.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import com.jc.dao.ISpecialtyDao;
import com.jc.dto.Specialty;

public class SpecialtyAction extends DispatchAction {

	private ISpecialtyDao specialtyDao;

	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}

	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		DynaActionForm specialtyForm = (DynaActionForm) form;
		Specialty specialty = new Specialty();
		specialty.setIsFinish(false); // 设置是否结业，默认为否
		specialty.setName(specialtyForm.getString("name"));
		specialty.setEnterYear(specialtyForm.getString("enterYear"));
		specialty.setLangthYear(specialtyForm.getString("langthYear"));
		specialtyDao.insert(specialty);
		List list = specialtyDao.findByAll();
		System.out.println(list);
		request.setAttribute("list", list);
		return mapping.findForward("showSpecialty");
	}

	/* 将专业设置为已结业 */
	public ActionForward updateIsFinish(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.valueOf(request.getParameter("id"));
		specialtyDao.updateIsFinish(id);
		return findAll(mapping, form, request, response);
	}

	public ActionForward findAll(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = specialtyDao.findByAll();
		System.out.println(list);
		request.setAttribute("list", list);
		return mapping.findForward("showSpecialty");
	}
}