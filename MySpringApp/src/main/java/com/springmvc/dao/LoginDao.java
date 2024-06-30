package com.springmvc.dao;

import com.springmvc.model.User;

public interface LoginDao {
	
	int getRole(String email, String password);
	
    User getByEmail(String email);
    
    boolean validate(String email, String password);
    
    void updateUser(User user);
    
    boolean emailExists(String email, int userId);
    
    boolean phoneExists(String mobilenumber, int userId);
    
}
