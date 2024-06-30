package com.springmvc.dao;

import com.springmvc.model.User;

public interface UserDao {
	
	void save(User user);
	
	boolean emailExists(String email, int userId);
    
    boolean phoneExists(String mobilenumber, int userId);
//	void updateUser(User user);
	
}
