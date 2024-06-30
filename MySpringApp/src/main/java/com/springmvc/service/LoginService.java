package com.springmvc.service;

import com.springmvc.model.User;

public interface LoginService {
	
	int getRole(String email, String password);
	
	User getByEmail(String email);
	
	boolean validate(String email, String password);
	
	void updateProfile(User user);
	
	boolean emailExists(String email, int userId);
	
	boolean phoneExists(String mobilenumber, int userId);
	
}

