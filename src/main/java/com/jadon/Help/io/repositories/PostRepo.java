package com.jadon.Help.io.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jadon.Help.io.models.Post;

@Repository
public interface PostRepo extends CrudRepository<Post, Long> {
	
	List<Post> findAll();
	
	@Query(value="select * from post where post.title like %:keyword%",
			nativeQuery=true)
	List<Post> findByKeyword(@Param("keyword") String keyword);
}
