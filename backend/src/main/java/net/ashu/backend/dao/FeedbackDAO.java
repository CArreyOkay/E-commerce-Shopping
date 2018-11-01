package net.ashu.backend.dao;

import java.util.List;

import net.ashu.backend.dto.Feedback;

public interface FeedbackDAO {
	
	Feedback get(int id);
	Feedback get(String email);
	List<Feedback> list();
	boolean add(Feedback feedback);
	boolean update(Feedback feedback);
	boolean delete(Feedback feedback);

}
