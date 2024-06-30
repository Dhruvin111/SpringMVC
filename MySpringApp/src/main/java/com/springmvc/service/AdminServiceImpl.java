package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.AdminDao;
import com.springmvc.model.User;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	private AdminDao adminDao;
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	@Override
	public List<User> getUsers() {
		return adminDao.getUserList();
	}

	@Override
	public User selectUser(int id) {
		return adminDao.getUserbyId(id);
	}

	@Override
	public boolean deleteUser(int id) {
		return adminDao.deleteUser(id);
	}

	@Override
	public boolean updateUser(User user) {
		return adminDao.updateUser(user);
	}

}
