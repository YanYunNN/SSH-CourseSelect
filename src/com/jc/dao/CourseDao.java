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
	public List<Course> findByAll() {// 查询所有课程
		List<Course> list = getHibernateTemplate().find("from Course");
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Course findByID(Integer id) {// 按照课程编号查找
		Course course = (Course) getHibernateTemplate().get(Course.class, id);
		return course;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object> findBySearch(Map<String, String> map) {// 按照专业名称、课程名称，授课教师查找

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
	public void insert(Course course) {// 增加新课程
		getHibernateTemplate().save(course);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {// 将课程设置为学生不可选
		Query q = getSession().createQuery(
				"UPDATE Course c SET c.isFinish=? WHERE c.id=?");
		q.setBoolean(0, false);// 将此课程设为不可选
		q.setInteger(1, id);
		q.executeUpdate();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findByStat(Map<String, String> map) {// 按照条件查询课程
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
	public List<Object[]> findSelectStu(Integer id) {// 查询出所有选择此课程的学生
		String sql = "FROM StuUser s,StuCourse sc WHERE sc.courseId=? AND s.id=sc.stuId";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		List<Object[]> list = q.list();
		return list;
	}
}
