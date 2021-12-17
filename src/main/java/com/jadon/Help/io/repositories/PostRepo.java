package com.jadon.Help.io.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jadon.Help.io.models.Post;

@Repository
public interface PostRepo extends CrudRepository<Post, Long> {
	List<Post> findAll();
}
