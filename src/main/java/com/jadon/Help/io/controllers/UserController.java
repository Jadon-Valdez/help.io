package com.jadon.Help.io.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jadon.Help.io.models.Comment;
import com.jadon.Help.io.models.LoginUser;
import com.jadon.Help.io.models.Post;
import com.jadon.Help.io.models.User;
import com.jadon.Help.io.services.PostService;
import com.jadon.Help.io.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;

	@Autowired
	private PostService postServ;

	// SHOW ONE USER
	@RequestMapping("/user")
	public String showUser(Model model) {
		return "/help/profile.jsp";
	}

	// CREATE USER
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/login/index.jsp";
	}

	// CREATE USER
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login/index.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";
	}

	// SUCCESS
	@GetMapping("/home")
	public String home(HttpSession s, Model model, String keyword) {
//		retrieve what is in session
		List<Post> posts = postServ.allPosts(keyword);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("id", thisUser.getId());
		System.out.println(thisUser);
		model.addAttribute("thisUser", thisUser);
		model.addAttribute("name", thisUser.getUserName());
		model.addAttribute("posts", posts);
		model.addAttribute("keyword", keyword);
		model.addAttribute("commentNew", new Comment());
		return "/login/main.jsp";
	}

	// LOGIN USER
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/login/index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/home";
	}

	// LOGOUT
	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";
	}
}
