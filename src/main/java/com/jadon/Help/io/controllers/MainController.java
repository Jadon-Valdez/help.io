package com.jadon.Help.io.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jadon.Help.io.models.Post;
import com.jadon.Help.io.models.User;
import com.jadon.Help.io.models.Comment;
import com.jadon.Help.io.services.PostService;
import com.jadon.Help.io.services.UserService;
import com.jadon.Help.io.services.CommentService;

@Controller
public class MainController {

	@Autowired
	private UserService userServ;
	@Autowired
	private PostService postServ;
	@Autowired
	private CommentService commentServ;

	@RequestMapping("/home")
	public String showAll(Model model) {
		List<Post> posts = postServ.allPosts();
		model.addAttribute("posts", posts);
		return "/login/main.jsp";
	}

	@RequestMapping("/post/new")
	public String createNew(@ModelAttribute("post") Post post, HttpSession s, Model model) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("posts", postServ.allPosts());
		if (userID == null) {
			return "redirect:/";
		} else {
			return "/help/create.jsp";
		}
	}

	@PostMapping(value = "/new")
	public String createPost(@Valid @ModelAttribute("post") Post post, BindingResult res, HttpSession s, Model model) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if (res.hasErrors()) {
			return "/help/create.jsp";
		} else {
			post.setUser(thisUser);
			postServ.createPost(post);
			return "redirect:/home";
		}
	}

	@RequestMapping("/post/{postId}")
	public String showPost(Comment comment, Model model, @PathVariable("postId") Long Id, HttpSession s) {
		Post post = postServ.findPost(Id);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		List<Comment> comments = commentServ.allComments();
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("post", post);
		model.addAttribute("loggedUser", userID);
		model.addAttribute("comments", post.getComments());
		model.addAttribute("commentNew", new Comment());
		model.addAttribute("comment", comment.getBody());
		if (userID == null) {
			return "redirect:/";
		} else {
			return "/help/showPost.jsp";
		}
	}

	@RequestMapping(value = "/comment/{postId}", method = RequestMethod.POST)
	public String comment(@Valid @ModelAttribute("comment") Comment comment, BindingResult res, HttpSession s,
			Model model, @PathVariable("postId") Long Id) {
		Post post = postServ.findPost(Id);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if (res.hasErrors()) {
			return "/help/showPost.jsp";
		} else {
			comment.setUser(thisUser);
			comment.setPost(post);
			commentServ.createComment(comment);
			return "redirect:/post/{postId}";
		}
	}

	@DeleteMapping("/comment/{id}/delete")
	public String DeleteComment(@PathVariable("id") Long id) {
		commentServ.deleteComment(id);
		return "redirect:/home";
	}

	@RequestMapping("/post/edit/{id}")
	public String editPost(Model model, @PathVariable("id") Long Id, HttpSession s) {
		Post post = postServ.findPost(Id);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("post", post);
		model.addAttribute("verifPost", post.getUser().getId());
		model.addAttribute("loggedUser", userID);
		return "/help/edit.jsp";
	}

	@RequestMapping(value = "/post/{id}", method = RequestMethod.PUT)
	public String updatePost(@Valid @ModelAttribute("post") Post post, HttpSession s, BindingResult result) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if (result.hasErrors()) {
			return "/help/edit.jsp";
		} else {
			post.setUser(thisUser);
			postServ.updatePost(post);
			return "redirect:/home";
		}
	}

	@DeleteMapping("/post/{id}")
	public String DeleteMe(@PathVariable("id") Long id) {
		postServ.deletePost(id);
		return "redirect:/home";
	}

	@RequestMapping("/user/{userId}")
	public String showUser(Model model, @PathVariable("userId") Long Id, HttpSession s) {
		User oneUser = userServ.findOne(Id);
		Long userID = (Long) s.getAttribute("user_id");
		model.addAttribute("user", oneUser);
		model.addAttribute("posts", oneUser.getPosts());
		model.addAttribute("loggedUser", userID);
		return "help/profile.jsp";
	}

	@GetMapping("/post/{id}/interested")
	public String addUserToPost(@PathVariable("id") Long post_id, HttpSession s) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		Post interested = postServ.findPost(post_id);
		interested.getInterested_users().add(thisUser);
		postServ.updatePost(interested);
		return "redirect:/home";
	}

	@RequestMapping("/interests/{userId}")
	public String showInterests(Model model, @PathVariable("userId") Long user_id, HttpSession s) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		List<Post> interests = thisUser.getPost();
		model.addAttribute("interests", interests);
		model.addAttribute("thisUser", thisUser);
		return "/help/interests.jsp";
	}

	@GetMapping("/post/{post_id}/notinterested")
	public String notInterested(@PathVariable("post_id") Long post_id, HttpSession s) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		Post interested = postServ.findPost(post_id);
		interested.getInterested_users().remove(thisUser);
		postServ.updatePost(interested);
		return "redirect:/home";
	}

}
