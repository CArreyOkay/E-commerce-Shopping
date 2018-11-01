package net.ashu.backend.daoimpl;

import java.util.List;

import net.ashu.backend.dao.FeedbackDAO;
import net.ashu.backend.dto.Feedback;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository("feedbackDAO")
@Transactional
public class FeedbackDAOImpl implements FeedbackDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Feedback get(int id) {
		return sessionFactory.getCurrentSession().get(Feedback.class, Integer.valueOf(id));
	}

	public Feedback get(String email) {
		return sessionFactory.getCurrentSession().get(Feedback.class, email);
	}

	public boolean add(Feedback feedback) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(feedback);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	public boolean update(Feedback feedback) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(feedback);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean delete(Feedback feedback) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().delete(feedback);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public List<Feedback> list() {
		
		String selectActiveCategory = "FROM Feedback";
		
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);				
		return query.getResultList();
	}

}
