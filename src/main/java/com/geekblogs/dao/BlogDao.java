package com.geekblogs.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.geekblogs.entities.Blog;
import com.geekblogs.entities.Category;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result; 



public class BlogDao {
	Connection con;

	public BlogDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getCategories(){
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			
			String q="Select *from category";
			Statement st=this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			
			while(set.next()) {
				int cid=set.getInt("cat_id");
				String name=set.getString("cat_name");
				String description=set.getString("cat_description");
				Category c=new Category(cid, name, description);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean saveBlog(Blog p) {
		boolean flag=false;
		
		try {
			
			String query="insert into blogs(blog_title, blog_content, cat_id, user_id, blog_image) values(?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, p.getBlog_title());
			pstmt.setString(2, p.getBlog_content());
			pstmt.setInt(3, p.getCat_id());
			pstmt.setInt(4, p.getUser_id());
			pstmt.setString(5, p.getBlog_image());
			pstmt.executeUpdate();
			flag=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	
	//fetching all posts on user profile
	public List<Blog> getAllBlogs(){
		List<Blog> list=new ArrayList<>();
		try {
			
			PreparedStatement p=con.prepareStatement("Select * from blogs order by blog_createdAt");
			ResultSet set=p.executeQuery();			
			
			while(set.next()) {
				int blog_id=set.getInt("blog_id");
				String blog_title=set.getString("blog_title");
				String blog_content=set.getString("blog_content");
				Timestamp blog_createdAt=set.getTimestamp("blog_createdAt");
				Timestamp blog_updatedAt=set.getTimestamp("blog_updatedAt");
				int cat_id=set.getInt("cat_id");
				int user_id=set.getInt("user_id");
				String blog_image=set.getString("blog_image");
				Blog blog=new Blog(blog_id, blog_title, blog_content, blog_createdAt, blog_updatedAt, cat_id, user_id, blog_image);
				list.add(blog);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//fetching selected posts on user profile by category 
	public List<Blog> getSelectedBlog(int cat_id){
		List<Blog> list=new ArrayList<>();
		try {
			
			PreparedStatement p=con.prepareStatement("Select * from blogs where cat_id=?");
			p.setInt(1, cat_id);
			ResultSet set=p.executeQuery();			
			
			while(set.next()) {
				int blog_id=set.getInt("blog_id");
				String blog_title=set.getString("blog_title");
				String blog_content=set.getString("blog_content");
				Timestamp blog_createdAt=set.getTimestamp("blog_createdAt");
				Timestamp blog_updatedAt=set.getTimestamp("blog_updatedAt");
				int user_id=set.getInt("user_id");
				String blog_image=set.getString("blog_image");
				Blog blog=new Blog(blog_id, blog_title, blog_content, blog_createdAt, blog_updatedAt, cat_id, user_id, blog_image);
				list.add(blog);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
