package com.kh.project.board.vo;

import java.util.Date;
import java.util.List;

public class Board {
	
	private int post_no;
	private String post_title;
	private String post_price;
	private String post_contents;
	private String post_address;
	private String post_yn;
	private Date post_date;
	private String post_tags;
	private String id;
	private int hit;
	private String post_code;
	private int alert_cnt;
	private String original_filename;
	private String rename_filename;
	private String file_path;
	private List<AlertPost> alertPost;
	
	public Board() {}

	public Board(int post_no, String post_title, String post_price, String post_contents, String post_address,
			String post_yn, Date post_date, String post_tags, String id, int hit, String post_code, int alert_cnt,
			String original_filename, String rename_filename, String file_path, List<AlertPost> alertPost) {
		super();
		this.post_no = post_no;
		this.post_title = post_title;
		this.post_price = post_price;
		this.post_contents = post_contents;
		this.post_address = post_address;
		this.post_yn = post_yn;
		this.post_date = post_date;
		this.post_tags = post_tags;
		this.id = id;
		this.hit = hit;
		this.post_code = post_code;
		this.alert_cnt = alert_cnt;
		this.original_filename = original_filename;
		this.rename_filename = rename_filename;
		this.file_path = file_path;
		this.alertPost = alertPost;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_price() {
		return post_price;
	}

	public void setPost_price(String post_price) {
		this.post_price = post_price;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

	public String getPost_address() {
		return post_address;
	}

	public void setPost_address(String post_address) {
		this.post_address = post_address;
	}

	public String getPost_yn() {
		return post_yn;
	}

	public void setPost_yn(String post_yn) {
		this.post_yn = post_yn;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public String getPost_tags() {
		return post_tags;
	}

	public void setPost_tags(String post_tags) {
		this.post_tags = post_tags;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public int getAlert_cnt() {
		return alert_cnt;
	}

	public void setAlert_cnt(int alert_cnt) {
		this.alert_cnt = alert_cnt;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getRename_filename() {
		return rename_filename;
	}

	public void setRename_filename(String rename_filename) {
		this.rename_filename = rename_filename;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public List<AlertPost> getAlertPost() {
		return alertPost;
	}

	public void setAlertPost(List<AlertPost> alertPost) {
		this.alertPost = alertPost;
	}

	@Override
	public String toString() {
		return "Board [post_no=" + post_no + ", post_title=" + post_title + ", post_price=" + post_price
				+ ", post_contents=" + post_contents + ", post_address=" + post_address + ", post_yn=" + post_yn
				+ ", post_date=" + post_date + ", post_tags=" + post_tags + ", id=" + id + ", hit=" + hit
				+ ", post_code=" + post_code + ", alert_cnt=" + alert_cnt + ", original_filename=" + original_filename
				+ ", rename_filename=" + rename_filename + ", file_path=" + file_path + ", alertPost=" + alertPost
				+ "]";
	}

	
		
	
	
}
