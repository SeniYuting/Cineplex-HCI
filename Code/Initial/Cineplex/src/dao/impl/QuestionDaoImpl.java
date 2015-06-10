package dao.impl;

import java.util.List;

import model.Question;
import dao.QuestionDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class QuestionDaoImpl extends YeekuHibernateDaoSupport implements QuestionDao {

	@Override
	public Integer save(Question question) {
		return (Integer) getHibernateTemplate().save(question);
	}

	@Override
	public Question getQuestionById(int question_id) {
		@SuppressWarnings("unchecked")
		List<Question> questions = (List<Question>) getHibernateTemplate().find("from Question as q where q.id=?", question_id);
		Question question = questions.get(0);
		return question;
	}
	
	@Override
	public List<Question> getQuestionsByMovieId(int movie_id) {
		@SuppressWarnings("unchecked")
		List<Question> questions = (List<Question>) getHibernateTemplate().find("from Question as q where q.movie_id=?", movie_id);
		return questions;
	}

	@Override
	public List<Question> getAllQuestions() {
		
		@SuppressWarnings("unchecked")
		List<Question> questions = (List<Question>)
				getHibernateTemplate().find("from Question");
		return questions;
	}

}
