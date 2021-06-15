package br.com.unipe.sirius.blog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.unipe.sirius.blog.dao.CommentDAO;
import br.com.unipe.sirius.blog.dao.PostDAO;
import br.com.unipe.sirius.blog.web.model.Comment;
import br.com.unipe.sirius.blog.web.model.Post;

@Controller
public class HomeController {

	@Autowired
	private PostDAO postDao;
	
	@Autowired
	private CommentDAO commentDao;

	public HomeController() {
		postDao = new PostDAO();
		commentDao = new CommentDAO();
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView view = new ModelAndView("home");
		view.addObject("posts", postDao.getAll());
		
		return view;
	}
	
	@RequestMapping(value = "/new-post", method = RequestMethod.GET)
	public ModelAndView newPost(Model model) {
		
		model.addAttribute("post", new Post());
		return new ModelAndView("new-post");
	}
	
	@RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
	public ModelAndView getPost(@PathVariable Long id, Model model) {
		ModelAndView view = new ModelAndView("post");
		
		model.addAttribute("comment", new Comment());
		
		view.addObject("post", postDao.getOne(id));
		view.addObject("comments", postDao.getComments(id));
		view.addObject("id", id);
		
		return view;
	}
	
	@RequestMapping(value = "/post/{id}", method = RequestMethod.POST)
	public String getPostAfterComment(@PathVariable Long id, @ModelAttribute Comment comment) {
		commentDao.create(comment, id);
		return "redirect:../post/" + id;
	}
	
	@RequestMapping(value = "/new-post", method = RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute Post post) {
		
		ModelAndView view = new ModelAndView("home");
		postDao.create(post);
		view.addObject("posts", postDao.getAll());
		
		return view;
	}
	
	@RequestMapping(value = "/post/delete/{postId}", method = RequestMethod.GET)
	public String deleteComment(@PathVariable Long postId, @RequestParam Long commentId) {
		System.out.println(postId);
		commentDao.delete(commentId);
		return "redirect:../" + postId;
	}
	
	@RequestMapping(value = "/post/edit-comment/{id}", method = RequestMethod.GET)
	public ModelAndView editComment(@PathVariable Long id) {
		ModelAndView view = new ModelAndView("edit-comment");
		view.addObject("comment", commentDao.getOne(id));
		view.addObject("postId", commentDao.getPostId(id));
		return view;
	}
	
	@RequestMapping(value = "/post/edit-comment/{id}", method = RequestMethod.POST)
	public String afterEditComment(@ModelAttribute Comment comment, @PathVariable Long id) {
		Long postId = commentDao.getPostId(id);
		
		commentDao.editPost(comment, commentDao.getPostId(id));
		
		return "redirect:/post/" + postId;
	}
}
