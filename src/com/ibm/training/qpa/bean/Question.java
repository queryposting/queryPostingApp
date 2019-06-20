package com.ibm.training.qpa.bean;

import java.util.Date;

public class Question {
	private int questionId, postedBy, type, topic;
	private String questionDesc;
	private Date dateQuestioned;
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getTopic() {
		return topic;
	}
	public void setTopic(int topic) {
		this.topic = topic;
	}
	public String getQuestionDesc() {
		return questionDesc;
	}
	public void setQuestionDesc(String questionDesc) {
		this.questionDesc = questionDesc;
	}
	public Date getDateQuestioned() {
		return dateQuestioned;
	}
	public void setDateQuestioned(Date dateQuestioned) {
		this.dateQuestioned = dateQuestioned;
	}
}
