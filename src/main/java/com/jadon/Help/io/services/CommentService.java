package com.jadon.Help.io.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jadon.Help.io.models.Comment;
import com.jadon.Help.io.repositories.CommentRepo;

@Service
public class CommentService {
	@Autowired
	private CommentRepo commentRepo;
	
//	CREATE
	public Comment createComment(Comment c) {
        return commentRepo.save(c);
    }
//	READ ALL
	public List<Comment> allComments() {
        return commentRepo.findAll();
    }
//	READ ONE
	public Comment findComment(Long id) {
        Optional<Comment> optionalComment = commentRepo.findById(id);
        if(optionalComment.isPresent()) {
            return optionalComment.get();
        } else {
            return null;
        }
	}
	
//	UPDATE entire book
	public Comment updateComment(Comment c) {
		return commentRepo.save(c);
	}
	
	
//	DELETE
	public void deleteComment(Long id) {
		commentRepo.deleteById(id);
	}
}
