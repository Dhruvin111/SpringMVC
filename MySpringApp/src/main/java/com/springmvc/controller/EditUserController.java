//package com.springmvc.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.springmvc.model.User;
//import com.springmvc.service.UserService;
//
//public class EditUserController {
//	
//	private UserService userservice;
//	
//	@Autowired
//	public EditUserController(UserService userservice) {
//		this.userservice = userservice;
//	}
//	
//	@GetMapping("/showeditprofile")
//	public String showEdit(Model model, HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		model.addAttribute("user", user);
//		return "edituserprofile";
//	}
//	
//	@PostMapping("/editprofile")
//	public String performEdit(@ModelAttribute("user") User user, @RequestParam("image") MultipartFile imagefile,
//			HttpSession session) {
//		byte[] imgdata = null;
//		if(!imagefile.isEmpty()) {
//			try {
//				byte[] data = imagefile.getBytes();
//				user.setImgdata(data);
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//		}else {
//			User sessionuser = (User) session.getAttribute("user");
//	        if (user != null) {
//	            imgdata = sessionuser.getImgdata();
//	            user.setImgdata(imgdata);
//	        }
//		}
//		userservice.updateProfile(user);
//		session.setAttribute("user", user);
//		
//		return "redirect:/profile";
//		
//	}
//}
