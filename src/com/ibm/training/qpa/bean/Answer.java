package com.ibm.training.qpa.bean;

import java.util.Date;

public class Answer {
	private int answerId, questionId, answeredBy, postedBy;
	private String answerDesc;
	private Date dateQuestioned, dateAnswered;
	public int getAnswerId() {
		return answerId;
	}
	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getAnsweredBy() {
		return answeredBy;
	}
	public void setAnsweredBy(int answeredBy) {
		this.answeredBy = answeredBy;
	}
	public int getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}
	public String getAnswerDesc() {
		return answerDesc;
	}
	public void setAnswerDesc(String answerDesc) {
		this.answerDesc = answerDesc;
	}
	public Date getDateQuestioned() {
		return dateQuestioned;
	}
	public void setDateQuestioned(Date dateQuestioned) {
		this.dateQuestioned = dateQuestioned;
	}
	public Date getDateAnswered() {
		return dateAnswered;
	}
	public void setDateAnswered(Date dateAnswered) {
		this.dateAnswered = dateAnswered;
	}
}
