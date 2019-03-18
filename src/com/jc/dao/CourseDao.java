package com.jc.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jc.dto.Course;

public class CourseDao extends HibernateDaoSupport implements ICourseDao {
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Course> findByAll() {// ��ѯ���пγ�
		List<Course> list = getHibernateTemplate().find("from Course");
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Course findByID(Integer id) {// ���տγ̱�Ų���
		Course course = (Course) getHibernateTemplate().get(Course.class, id);
		return course;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object> findBySearch(Map<String, String> map) {// ����רҵ���ơ��γ����ƣ��ڿν�ʦ����

		String sql = "FROM Specialty s, Course c Where s.id=c.specialtyId ";
		if (map.get("specialtyId") != null) {
			sql += " AND c.specialtyId = " + map.get("specialtyId");
		}
		if (map.get("name") != null) {
			sql += " AND c.name like '%" + map.get("name") + "%'";
		}
		if (map.get("teacherName") != null) {
			sql += " AND c.teacherName like '%" + map.get("teacherName") + "%'";
		}
		List<Object> list = getHibernateTemplate().find(sql);
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Course course) {// �����¿γ�
		getHibernateTemplate().save(course);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {// ���γ�����Ϊѧ������ѡ
		Query q = getSession().createQuery(
				"UPDATE Course c SET c.isFinish=? WHERE c.id=?");
		q.setBoolean(0, false);// ���˿γ���Ϊ����ѡ
		q.setInteger(1, id);
		q.executeUpdate();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findByStat(Map<String, String> map) {// ����������ѯ�γ�
		String sql = "SELECT c.id,c.name,c.teacherName,c.schooltime,c.addr,"
				+ "s.enterYear,s.langthYear,s.name,s.id "
				+ "FROM Course c,Specialty s " + "WHERE s.id=c.specialtyId ";
		if (map.get("specialtyId") != null) {
			sql += " AND c.specialtyId = " + map.get("specialtyId");
		}
		if (map.get("name") != null) {
			sql += " AND c.name like '%" + map.get("name") + "%'";
		}
		if (map.get("teacherName") != null) {
			sql += " AND c.teacherName like '%" + map.get("teacherName") + "%'";
		}
		List<Object[]> list = getHibernateTemplate().find(sql);
		System.out.println(list.size());
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findSelectStu(Integer id) {// ��ѯ������ѡ��˿γ̵�ѧ��
		String sql = "FROM StuUser s,StuCourse sc WHERE sc.courseId=? AND s.id=sc.stuId";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		List<Object[]> list = q.list();
		return list;
	}
}
