package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static MemberDao instance = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_db?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false","root","1234");
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	// 데이터베이스 연결 종료
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
	
	public List<Member> getMemberScore() {
		
		List<Member> list = null;
		
		
		String strSql = "SELECT * FROM member_table ORDER BY mem_score DESC";
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			list = new ArrayList<>();
			while(rs.next()) {
				Member mem = new Member();
				String mem_id = rs.getString("mem_id");
				int mem_score = rs.getInt("mem_score");
				String mem_image = rs.getNString("mem_image");

				mem.setId(mem_id); 
				mem.setScore(mem_score);
				mem.setImage(mem_image);
				//for (int i = 0; i <10; i++) {
				list.add(mem);
				//}			
				
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
					
		return list;			
	}
	
	public int setMember(Member member) { 		
		int status = 0;
		conn = getConnection();
		String strSql = "INSERT INTO member_table VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			ps = conn.prepareStatement(strSql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getGender());
			ps.setInt(5, member.getAge());
			ps.setString(6, member.getPhone());
			ps.setString(7, member.getEmail());
			ps.setString(8, member.getService());
			ps.setString(9, member.getImage());
			ps.setInt(10, member.getHeight());
			ps.setInt(11, member.getWeight());
			ps.setInt(12, member.getScore());
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int editMember(String ID, String PW, String renewPw) { 		
		int status = 0;
		conn = getConnection();
		String strSql = "update member_table SET mem_pw='" + renewPw + "' where mem_id='" + ID + "';";
		try {
			ps = conn.prepareStatement(strSql);
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public String getPassword(String id) {
		String pwd = "";
		String strSql = "SELECT mem_pw FROM member_table WHERE mem_id='" + id + "';";
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				pwd = rs.getString("mem_pw");
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
					
		return pwd;			
	}
	
	public Member getMemInfo(String id) {
		Member mem = new Member();
		String strSql = "SELECT mem_name, mem_phone, mem_email, mem_service, mem_score FROM member_table WHERE mem_id='" + id + "';";
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				mem.setName(rs.getString("mem_name"));
				mem.setPhone(rs.getString("mem_phone"));
				mem.setEmail(rs.getString("mem_email"));
				mem.setService(rs.getString("mem_service"));
				mem.setScore(rs.getInt("mem_score"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
					
		return mem;			
	}
	
	public int setScore(String id, int score) { 		
		int status = 0;
		conn = getConnection();
		String strSql = "UPDATE member_table SET mem_score=mem_score+" + score + " WHERE mem_id='" + id + "';";
		System.out.println(strSql);
		try {
			ps = conn.prepareStatement(strSql);
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

}
