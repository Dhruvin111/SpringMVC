package com.springmvc.dao;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.model.User;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public LoginDaoImpl(SessionFactory sessionfactory) {
		this.sessionFactory = sessionfactory;
	}
	
	@Override
	public int getRole(String email, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("SELECT u.role FROM User u WHERE u.email = :email AND u.password = :password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		int role = query.uniqueResult() != null ? (int) query.uniqueResult() : -1;
		return role;
	}

	@Override
	public User getByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM User WHERE email = :email", User.class)
				.setParameter("email", email).uniqueResult();
	}

	@Override
	public boolean validate(String email, String password) {
	    Session session = sessionFactory.getCurrentSession();
	    Long count = session.createQuery("SELECT COUNT(*) FROM User WHERE email = :email AND password = :password", Long.class)
	                        .setParameter("email", email)
	                        .setParameter("password", password)
	                        .uniqueResult();
	    return count != null && count > 0;
	}
	
	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
	}
	
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
	}
