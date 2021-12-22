package com.jadon.Help.io.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jadon.Help.io.models.Post;
import com.jadon.Help.io.repositories.PostRepo;

@Service
public class PostService {
	@Autowired
	private PostRepo postRepo;
	
//	CREATE
	public Post createPost(Post p) {
        return postRepo.save(p);
    }
//	READ ALL
	public List<Post> allPosts(String keyword) {
		if(keyword != null) {
			return postRepo.findByKeyword(keyword);
		}
        return postRepo.findAll();
    }
//	READ ONE
	public Post findPost(Long id) {
        Optional<Post> optionalPost = postRepo.findById(id);
        if(optionalPost.isPresent()) {
            return optionalPost.get();
        } else {
            return null;
        }
	}
	
	public Post updatePost(Post p) {
		return postRepo.save(p);
	}
	
	
	public void deletePost(Long id) {
		postRepo.deleteById(id);
	}
	
}
