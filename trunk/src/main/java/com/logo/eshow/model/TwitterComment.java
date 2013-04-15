package com.logo.eshow.model;

import com.logo.eshow.model.BaseObject;
import com.logo.eshow.model.User;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

/**
 * 
 * @author leida
 * 
 */
@Entity
@Table(name = "twitter_comment")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class TwitterComment extends BaseObject implements Serializable {
	/**
	 * 微博评论
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//微博评论ID
	private User user;//用户
	private Twitter twitter;//微博
	private Date addTime;//添加时间
	private String content;//内容
	private String website;//网站

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "twitterId")
	public Twitter getTwitter() {
		return this.twitter;
	}

	public void setTwitter(Twitter twitter) {
		this.twitter = twitter;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "content", length = 400)
	public String getContent() {
		return content;
	}
	
	@Column(name = "website",length=20)
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		TwitterComment pojo = (TwitterComment) o;

		if (user != null ? !user.equals(pojo.user) : pojo.user != null)
			return false;
		if (website != null ? !website.equals(pojo.user) : pojo.website != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime)
				: pojo.addTime != null)
			return false;
		if (content != null ? !content.equals(pojo.content)
				: pojo.content != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (user != null ? user.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}