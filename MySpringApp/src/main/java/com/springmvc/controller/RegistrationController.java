package com.springmvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springmvc.model.User;
import com.springmvc.service.UserService;

@Controller
public class RegistrationController {
	
	private UserService service;
	
	@Autowired
	public RegistrationController(UserService service) {
		this.service =service;
	}
	
	@GetMapping("/")
	public String registerform(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}
	
	@GetMapping("/login")
    public String showLoginPage() {
        return "login"; // returns login.jsp
    }

	@PostMapping("/register")
	public String register(@ModelAttribute("user") User user, @RequestParam(value = "image") MultipartFile imagefile, HttpSession session, @RequestParam("email") String email, @RequestParam("mobilenumber") String mobilenumber) {
		
	    if (!imagefile.isEmpty()) {
	        try {
	            byte[] bytes = imagefile.getBytes();
	            user.setImgdata(bytes);

	            boolean emailExists = service.emailExists(email,user.getId());

	            boolean phoneExists = service.phoneExists(mobilenumber,user.getId());
	            
	            if (emailExists || phoneExists) {
	            	if (emailExists) {
	            		session.setAttribute("emailExists",true);
	            	}
	            	if (phoneExists) {
	            		session.setAttribute("phoneExists", true);
	            	}
	            	return "redirect:/"; 
	            } else {
	            	service.registerUser(user);
	            	session.setAttribute("success", true);
	            	return "redirect:/login";
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "redirect:/error";
	        }
	    } else {
	        return "redirect:/error";
	    }
	}
	
	}

