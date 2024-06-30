package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.LoginDao;
import com.springmvc.model.User;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	private LoginDao logindao;
	
	@Autowired
	public LoginServiceImpl(LoginDao logindao) {
		this.logindao = logindao;
	}
	
	@Override
	public int getRole(String email, String password) {
		return logindao.getRole(email, password);
	}

	@Override
	public User getByEmail(String email) {
		return logindao.getByEmail(email);
	}

	@Override
	public boolean validate(String email, String password) {
		return logindao.validate(email, password);
	}
	
	@Override
	public void updateProfile(User user) {
		logindao.updateUser(user);
	}

	@Override
	public boolean emailExists(String email, int userId) {
		return logindao.emailExists(email, userId);
	}

	@Override
	public boolean phoneExists(String mobilenumber, int userId) {
		return logindao.phoneExists(mobilenumber, userId);
	}
}
