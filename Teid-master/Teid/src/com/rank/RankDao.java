package com.rank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RankDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static RankDao instance = new RankDao();
	
	private RankDao() {}
	
	public static RankDao getInstance() {
		return instance;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_db?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false","root","1234");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//데이터 베이스 연결 종료
	private void quitDB() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	public Rank getRankInfo(int score) {
		Rank rank = new Rank();
		String strSql = "SELECT * FROM member_table ORDER BY mem_score DESC";
		return rank;
		
	}
	
}
