package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.model.User;
import com.springmvc.service.LoginService;

@Controller
public class LoginController {

	private LoginService loginService;

	@Autowired
	public LoginController(LoginService loginservice) {
		this.loginService = loginservice;
	}
	
	// Handles user logout by invalidating the session
	@PostMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute("listuser");
			session.removeAttribute("user");
			session.invalidate();	// Invalidate the session
		}
		return "redirect:/login";	// Redirect to login page after logout
	}
	
	// For Displaying profile
	@GetMapping("/profile")
	public String showProfilePage() {
		return "profile";			// Render the profile page
	}
	
	// Validating credentials for login
	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpSession session) {

		boolean isValid = loginService.validate(email, password);

		if (isValid) {
			int role = loginService.getRole(email, password);
			if ("admin@gmail.com".equals(email) && "admin@123".equals(password) && role == 1) {
				System.out.println("LOGGED IN AS ADMIN SUCCESSFULLY");
				session.setAttribute("loginSuccessMessage","logged in succesfully" );
				return "redirect:adminserv";	//Redirecting to admin controller which displays admin panel
			} else {
				User user = loginService.getByEmail(email);
				session.setAttribute("user", user);
				session.setAttribute("loginsuccess",true);
				return "redirect:/profile";		// Redirecting to profile controller which displays user profile
			}
		} else {
			session.setAttribute("error", true);
			return "redirect:/login";			// If credentials are wrong then stays in login controller
		}
	}
	
	// Displays the edit profile page with pre-filled user data
	@GetMapping("/showeditprofile")
	public String showEdit(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "edituserprofile";				// Render the edit profile page	 
	}
	
	// Handles user profile edits
	@PostMapping("/editprofile")
	public String performEdit(@ModelAttribute("user") User user, @RequestParam("imagefile") MultipartFile imagefile,
			HttpSession session, @RequestParam("email") String email, @RequestParam("mobilenumber") String mobilenumber) {
		byte[] imgdata = null;
		if(!imagefile.isEmpty()) {
			try {
				byte[] data = imagefile.getBytes();
				user.setImgdata(data);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			User sessionuser = (User) session.getAttribute("user");
	        if (user != null) {
	            imgdata = sessionuser.getImgdata();
	            user.setImgdata(imgdata);
	        }
		}
		//Storing flag value if email exists
		boolean emailExists = loginService.emailExists(email, user.getId());
		//Storing flag value if phone exists exists
		boolean phoneExists = loginService.phoneExists(mobilenumber, user.getId());
		
		
		if(emailExists || phoneExists) {			
			if (emailExists) {
		        session.setAttribute("emailExists", true);
				}
			else if(phoneExists) {
				session.setAttribute("phoneExists", true);
			}
			return "redirect:/showeditprofile"; // Redirect to the show edit profile controller		
	    } else {
	        loginService.updateProfile(user);
	        session.setAttribute("user", user);
	        session.setAttribute("editsuccess", true);
	        return "redirect:/profile";			// Redirect to the profile controller
	    }
//		loginservice.updateProfile(user);
//		session.setAttribute("user", user);
//		System.out.println(user.getDateofbirth());
//		session.setAttribute("editsuccess",true);
//		return "redirect:/profile";
	}
}
