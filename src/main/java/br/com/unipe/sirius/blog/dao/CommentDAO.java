package br.com.unipe.sirius.blog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.unipe.sirius.blog.web.model.Comment;
import br.com.unipe.sirius.blog.web.model.Post;

@Repository
public class CommentDAO {

	public CommentDAO() {}
	
	@PersistenceContext
	private EntityManager entityManager;	
	
	@Transactional(readOnly = false)
	public void create(Comment comment, Long postId) {

		Post post = entityManager.find(Post.class, postId);
		List<Comment> comments = post.getComments();

		Comment newComment = new Comment();
		newComment.setContent(comment.getContent());
		newComment.setName(comment.getName());
		
		newComment.setPost(post);
		comments.add(newComment);
		
		post.setComments(comments);
		
		entityManager.persist(post);
	}
	
	@Transactional(readOnly = false)
	public void delete(Long commentId) {
		Comment comment = entityManager.find(Comment.class, commentId);
		Post post = comment.getPost();
		post.getComments().remove(comment);
		
		entityManager.merge(post);
	}
	
	@Transactional(readOnly = false)
	public void editPost(Comment comment, Long postId) {
		comment.setPost(entityManager.find(Post.class, postId));
		entityManager.merge(comment);
	}
	
	@Transactional(readOnly = true)
	public Comment getOne(Long commentId) {
		return entityManager.find(Comment.class, commentId);
	}
	
	@Transactional(readOnly = true)
	public Long getPostId(Long commentId) {
		return entityManager.find(Comment.class, commentId).getPost().getId();
	}
}
