package dao.impl;

import java.util.List;

import model.Answer;
import dao.AnswerDao;
import hibernate3.support.YeekuHibernateDaoSupport;

public class AnswerDaoImpl extends YeekuHibernateDaoSupport implements
		AnswerDao {

	@Override
	public Integer save(Answer answer) {
		return (Integer) getHibernateTemplate().save(answer);
	}

	@Override
	public Answer getAnswerById(int answer_id) {
		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) getHibernateTemplate().find(
				"from Answer as a where a.id=?", answer_id);
		Answer answer = answers.get(0);
		return answer;
	}

	@Override
	public List<Answer> getAnswerByQusIdandMemId(int question_id, int member_id) {
		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) getHibernateTemplate().find(
				"from Answer as a where a.question_id=? and a.member_id=?",
				question_id, member_id);
		return answers;
	}

	@Override
	public List<Answer> getAllAnswers() {

		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) getHibernateTemplate().find(
				"from Answer");
		return answers;
	}

	@Override
	public void update(Answer answer) {
		getHibernateTemplate().merge(answer);
	}

	@Override
	public List<Answer> getAnswersByQuestionId(int question_id) {
		@SuppressWarnings("unchecked")
		List<Answer> answers = (List<Answer>) getHibernateTemplate().find(
				"from Answer as a where a.question_id=?", question_id);
		return answers;
	}

}
