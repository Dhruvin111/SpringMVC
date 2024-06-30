package com.springmvc.dao;

import java.util.List;

import com.springmvc.model.User;

public interface AdminDao {
	
	List<User> getUserList();
	
	User getUserbyId(int id);
	
	boolean deleteUser(int id);
	
	boolean updateUser(User user);
	
}
