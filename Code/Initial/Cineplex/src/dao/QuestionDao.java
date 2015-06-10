package dao;

import java.util.List;

import model.Question;

public interface QuestionDao {
	
	public Integer save(Question question);

	public Question getQuestionById(int question_id);
	
	public List<Question> getQuestionsByMovieId(int movie_id);
	
	public List<Question> getAllQuestions();

}