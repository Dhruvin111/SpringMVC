package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.UserDao;
import com.springmvc.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	private UserDao userdao;
	
	@Autowired
	public UserServiceImpl(UserDao userdao) {
		this.userdao = userdao;
	}
	
	@Override
	public void registerUser(User user) {
		userdao.save(user);
	}

	@Override
	public boolean emailExists(String email, int userId) {
		// TODO Auto-generated method stub
		return userdao.emailExists(email, userId);
	}

	@Override
	public boolean phoneExists(String mobilenumber, int userId) {
		// TODO Auto-generated method stub
		return userdao.phoneExists(mobilenumber, userId);
	}

//	@Override
//	public void updateProfile(User user) {
//		userdao.updateUser(user);
//	}
}
