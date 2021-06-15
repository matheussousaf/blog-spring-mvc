package br.com.unipe.sirius.blog.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.unipe.sirius.blog.web.model.Comment;
import br.com.unipe.sirius.blog.web.model.Post;

@Repository
public class PostDAO {

	public PostDAO() {}
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional(readOnly = false)
	public void create(Post post) {
		entityManager.persist(post)	;
	}
	
	@Transactional(readOnly = true)
	public List<Post> getAll() {
		
		String jpql = "from Post u";
		TypedQuery<Post> query = entityManager.createQuery(jpql, Post.class);

		return query.getResultList();
	}
	
	@Transactional(readOnly = true)
	public Post getOne(Long id) {
		return entityManager.find(Post.class, id);
	}
	
	@Transactional(readOnly = true)
	public List<Comment> getComments(Long postId) {
		
		Post post = entityManager.find(Post.class, postId);
		
		return post.getComments();	
	}
}
