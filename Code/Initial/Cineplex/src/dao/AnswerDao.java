package dao;

import java.util.List;

import model.Answer;

public interface AnswerDao {
	
	public Integer save(Answer answer);

	public Answer getAnswerById(int answer_id);
	
	public List<Answer> getAnswerByQusIdandMemId(int question_id, int member_id);
	
	public List<Answer> getAllAnswers();
	
	public void update(Answer answer);
	
	public List<Answer> getAnswersByQuestionId(int question_id);

}