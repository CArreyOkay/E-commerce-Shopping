package net.ashu.shopping.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.ashu.backend.dao.CategoryDAO;
import net.ashu.backend.dao.FeedbackDAO;
import net.ashu.backend.dao.ProductDAO;
import net.ashu.backend.dto.Category;
import net.ashu.backend.dto.Feedback;
import net.ashu.backend.dto.Product;
import net.ashu.shopping.exception.ProductNotFoundException;
import net.ashu.shopping.service.EmailService;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FeedbackDAO feedbackdao;
	
	private boolean checkLogin = false;
	


	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index(@RequestParam(name = "logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");

//		logger.info("Inside PageController index method - INFO");
//		logger.debug("Inside PageController index method - DEBUG");

		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());

		if (logout != null) {
			mv.addObject("message", "You have successfully logged out!");
			
		}

		mv.addObject("userClickHome", true);
		mv.addObject("checkLogin",checkLogin);
		return mv;
	}
	
	
	@RequestMapping(value = "/contact/feedback")
	public ModelAndView sendfeedback(@ModelAttribute("feedback") Feedback mFeedback, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("page");
		feedbackdao.add(mFeedback);
		String subject = "Complaint / Feedback on "+mFeedback.getProduct()+" from "+mFeedback.getName()+" | FEEDBACK #"+mFeedback.getId();
		String sendto = "ADMIN";
		mv.addObject("name", mFeedback.getName());
		mv.addObject("feedbacknumber", mFeedback.getId());
		mv.addObject("userClickFeedback",true);
		mv.addObject("title", "Feedback");
		new EmailService(sendto, subject, mFeedback.getMessage(), mFeedback.getEmail());
		
		
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");

		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");

		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("products", productDAO.list());

		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	/*
	 * Methods to load all the products and based on category
	 */

	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");

		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("userClickAllProducts", true);
		return mv;
	}

	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");

		// categoryDAO to fetch a single category
		Category category = null;

		category = categoryDAO.get(id);

		mv.addObject("title", category.getName());

		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());

		// passing the single category object
		mv.addObject("category", category);

		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}

	/*
	 * Viewing a single product
	 */

	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {

		ModelAndView mv = new ModelAndView("page");

		Product product = productDAO.get(id);
		mv.addObject("categories", categoryDAO.list());

		if (product == null)
			throw new ProductNotFoundException();

		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		// ---------------------------

		mv.addObject("title", product.getName());
		mv.addObject("product", product);

		mv.addObject("userClickShowProduct", true);

		return mv;

	}

	@RequestMapping(value = "/membership")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");

		logger.info("Page Controller membership called!");

		return mv;
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name = "error", required = false) String error,
			@RequestParam(name = "logout", required = false) String logout ,@RequestParam(name="username",required= false) String username) {
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("title", "Login");
		checkLogin = true;
		if (error != null) {
			mv.addObject("message", "Username and Password is invalid!");
			checkLogin = false;
		}
		if (logout != null) {
			mv.addObject("logout", "You have logged out successfully!");
			checkLogin = false;
			
		}
		System.out.println(username);
		if(username != null){
			String sendto = username;
			Date d = new Date();
			String subject = "Logged In !";
			String body = "You were logged in at "+d.getTime()+"from PC Named : "+fetchPcName()+"\n\nRegards,\nTeam Brandgenius.";
			new EmailService(username, subject, body);
		}
		return mv;
		
	}
	
	String hostname = "unknown";

	public String fetchPcName() {
		try {
			InetAddress addr;
			addr = InetAddress.getLocalHost();
			hostname = addr.getHostName();
			System.out.println("Hostname : " + hostname);
		} catch (UnknownHostException ex) {
			System.out.println("Hostname can not be resolved");
		}
		return hostname;
	}
	

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Invalidates HTTP Session, then unbinds any objects bound to it.
		// Removes the authentication from securitycontext
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			checkLogin = false;
		}
		
		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Aha! Caught You.");
		mv.addObject("errorDescription", "You are not authorized to view this page!");
		mv.addObject("title", "403 Access Denied");
		return mv;
	}

}
