package bean;

public class Question {
	private String ques;
	private String quesid;
	private String option1;
	private String option2;
	private String correctAnswer;
	
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	private String option3;
	private String option4;
	private String status;
	
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getQuesid() {
		return quesid;
	}
	public void setQuesid(String quesid) {
		this.quesid = quesid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status=status;
	}
	
}
