package com.springmvc.service;

import java.util.List;

import com.springmvc.model.User;

public interface AdminService {

	List<User> getUsers();

	User selectUser(int id);

	boolean deleteUser(int id);

	boolean updateUser(User user);
}
