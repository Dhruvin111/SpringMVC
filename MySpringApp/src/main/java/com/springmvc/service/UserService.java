package com.springmvc.service;

import com.springmvc.model.User;

public interface UserService {

	void registerUser(User user);
	
	boolean emailExists(String email, int userId);
	
	boolean phoneExists(String mobilenumber, int userId);
}
