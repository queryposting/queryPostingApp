package com.ibm.training.qpa.bean;

import java.util.Date;

public class Content {
	private int contentId, questionId, answerId, postedBy, answeredBy, views, upvote, share;
	private Date dateQuestioned, dateAnswered;
	private boolean hide;
	public boolean isHide() {
		return hide;
	}
	public void setHide(boolean hide) {
		this.hide = hide;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getAnswerId() {
		return answerId;
	}
	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}
	public int getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(int postedBy) {
		this.postedBy = postedBy;
	}
	public int getAnsweredBy() {
		return answeredBy;
	}
	public void setAnsweredBy(int answeredBy) {
		this.answeredBy = answeredBy;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getUpvote() {
		return upvote;
	}
	public void setUpvote(int upvote) {
		this.upvote = upvote;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
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
