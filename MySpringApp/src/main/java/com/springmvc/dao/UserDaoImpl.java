package com.springmvc.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.springmvc.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public UserDaoImpl(SessionFactory sessionfactory) {
		this.sessionFactory = sessionfactory;
	}
	
	//Storing data in Database
	@Override
	public void save(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	//Checking whether email exists or not to avoid duplication 
	@Override
	public boolean emailExists(String email, int userId) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT COUNT(*) FROM User WHERE email = :email AND id != :userId");
        query.setParameter("email", email);
        query.setParameter("userId", userId);
        try {
            Long count = (Long) query.getSingleResult();
            return count != null && count > 0;
        } catch (NoResultException e) {
            return false;
        }
	}
	
	//Checking whether phoneNumber exists or not to avoid duplication
	@Override
    public boolean phoneExists(String mobilenumber, int userId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT COUNT(*) FROM User WHERE mobilenumber = :mobilenumber AND id != :userId");
        query.setParameter("mobilenumber", mobilenumber);
        query.setParameter("userId", userId);
        try {
            Long count = (Long) query.getSingleResult();
            return count != null && count > 0;
            } catch (NoResultException e) {
                return false;
            }        
    	}

//	@Override
//	public void updateUser(User user) {
//		Session session = sessionfactory.getCurrentSession();
//		session.update(user);
//	}
}
