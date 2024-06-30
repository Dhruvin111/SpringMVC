package com.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.model.User;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public AdminDaoImpl(SessionFactory sessionfactory) {
		this.sessionFactory = sessionfactory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserList() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM User WHERE role = 0").getResultList();
	}

	@Override
	public User getUserbyId(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, id);
	}

	@Override
	public boolean deleteUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, id);
		if(user!=null) {
			session.delete(user);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
		return true;
	}

}
