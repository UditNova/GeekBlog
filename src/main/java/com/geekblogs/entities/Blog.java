package com.geekblogs.entities;

import java.sql.Timestamp;

public class Blog {
	
	private int blog_id;
	private String blog_title;
	private String blog_content;
	private Timestamp blog_createdAt;
	private Timestamp blog_updatedAt;
	private int cat_id;
	private int user_id;
	private String blog_image;
	
	
	public Blog(int blog_id, String blog_title, String blog_content,  Timestamp blog_createdAt,
			Timestamp blog_updatedAt, int cat_id, int user_id, String blog_image) {
		super();
		this.blog_id = blog_id;
		this.blog_title = blog_title;
		this.blog_content = blog_content;
		this.blog_createdAt = blog_createdAt;
		this.blog_updatedAt = blog_updatedAt;
		this.cat_id = cat_id;
		this.user_id=user_id;
		this.blog_image=blog_image;
	}


	public Blog() {
	
	}


	public Blog(String blog_title, String blog_content, Timestamp blog_createdAt,
			Timestamp blog_updatedAt, int cat_id, int user_id, String blog_image) {
		super();
		this.blog_title = blog_title;
		this.blog_content = blog_content;
		this.blog_createdAt = blog_createdAt;
		this.blog_updatedAt = blog_updatedAt;
		this.cat_id = cat_id;
		this.user_id=user_id;
		this.blog_image=blog_image;
	}


	public int getBlog_id() {
		return blog_id;
	}


	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}


	public String getBlog_title() {
		return blog_title;
	}


	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}


	public String getBlog_content() {
		return blog_content;
	}


	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}

	public Timestamp getBlog_createdAt() {
		return blog_createdAt;
	}


	public void setBlog_createdAt(Timestamp blog_createdAt) {
		this.blog_createdAt = blog_createdAt;
	}


	public Timestamp getBlog_updatedAt() {
		return blog_updatedAt;
	}


	public void setBlog_updatedAt(Timestamp blog_updatedAt) {
		this.blog_updatedAt = blog_updatedAt;
	}


	public int getCat_id() {
		return cat_id;
	}


	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getBlog_image() {
		return blog_image;
	}


	public void setBlog_image(String blog_image) {
		this.blog_image = blog_image;
	}
	
	
	
}
