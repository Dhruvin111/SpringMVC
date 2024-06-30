package com.springmvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.model.User;
import com.springmvc.service.AdminService;

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	//Displaying Admin Panel
	@GetMapping("adminserv")
	public String UserList(Model model, HttpSession session) {
//		model.addAttribute("listuser", adminService.getUsers());
//		session.setAttribute("listuser", adminService.getUsers());
		List<User> userList = adminService.getUsers();
		session.setAttribute("listuser", userList);
		if (session.getAttribute("loginSuccessMessage") != null) {
	        model.addAttribute("loginSuccessMessage", session.getAttribute("loginSuccessMessage"));
	        session.removeAttribute("loginSuccessMessage");
		}	
		return "user-list";
	}
	
	//Displaying Edit page
	@GetMapping("editpage")
	public String editPage(@RequestParam("id") int id, Model model) {
		User user = adminService.selectUser(id);
		model.addAttribute("user", user);
		return "update";
	}
	
	//Edit Functionality for Admin 
	@PostMapping("edit")
	public String updateUser(@ModelAttribute("user") User user, @RequestParam("image") MultipartFile imagefile, HttpSession session) {
		
		User existingUser = adminService.selectUser(user.getId());
		
	    user.setEmail(existingUser.getEmail());
	    user.setPassword(existingUser.getPassword());
	    user.setMobilenumber(existingUser.getMobilenumber());
			
		if(!imagefile.isEmpty()) {
			try {
				byte[] data = imagefile.getBytes();
				user.setImgdata(data);
			} catch (IOException e) {
				e.printStackTrace();
			}			
		} else {
			user.setImgdata(existingUser.getImgdata());
		}
		adminService.updateUser(user);
		session.setAttribute("editsuccess", true);
		return "redirect:/adminserv";
	}
	
	//Delete functionality for admin
	@GetMapping("delete")
	public String deleteUser(@RequestParam("id") int id, HttpSession session) {
		adminService.deleteUser(id);
		session.setAttribute("deletesuccess", true);
		return "redirect:/adminserv";
	}
}
