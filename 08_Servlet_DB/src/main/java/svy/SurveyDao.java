package svy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SurveyDao {
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private String id = "jspid";
//	private String pw = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
//	public SurveyDao() {
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, id, pw);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

	public SurveyDao(String driver, String url, String user, String password) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertSurvey(SurveyBean sb) {
		String sql = "insert into survey values(sseq.nextval,?,?,?,?,?,?,?)";
		String part = "";
		if(sb.getPart() == null) {
			part = "선택한 관심분야 없음";
		}else {
			for(String p : sb.getPart()) {
				part += p + "/";
			}
		}
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getName());
			ps.setString(2, sb.getCompany());
			ps.setString(3, sb.getEmail());
			ps.setString(4, sb.getSatisfaction());
			ps.setString(5, part);
			ps.setString(6, sb.getHowto());
			ps.setInt(7, sb.getAgree());
			
			int cnt = ps.executeUpdate();
			System.out.println("insert cnt : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<SurveyBean> getAllSurvey() {
		ArrayList<SurveyBean> list = new ArrayList<SurveyBean>();
		String sql = "select * from survey order by no";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				SurveyBean sb = new SurveyBean();
				sb.setNo(rs.getInt("no"));
				sb.setName(rs.getString("name"));
				sb.setCompany(rs.getString("company"));
				sb.setEmail(rs.getString("email"));
				sb.setSatisfaction(rs.getString("satisfaction"));
				String part = rs.getString("part");
				sb.setPart(part.split("/"));
				sb.setHowto(rs.getString("howto"));
				sb.setAgree(rs.getInt("agree"));
				list.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public void deleteSurvey(String no) {
		String sql = "delete survey where no=" + no;
		try {
			ps = conn.prepareStatement(sql);
			int cnt = ps.executeUpdate();
			System.out.println("delete cnt : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public SurveyBean getOneSurvey(String no) {
		SurveyBean sb = new SurveyBean();
		String sql = "select * from survey where no=" + no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				sb.setNo(rs.getInt("no"));
				sb.setName(rs.getString("name"));
				sb.setCompany(rs.getString("company"));
				sb.setEmail(rs.getString("email"));
				sb.setSatisfaction(rs.getString("satisfaction"));
				String part = rs.getString("part");
				sb.setPart(part.split("/"));
				sb.setHowto(rs.getString("howto"));
				sb.setAgree(rs.getInt("agree"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb;
	}

	public void updateSurvey(SurveyBean sb) {
		String sql = "update survey set name=?, company=?, email=?, satisfaction=?, part=?, howto=?, agree=? where no=?";
		String part = "";
		if(sb.getPart() == null) {
			part = "선택한 관심분야 없음";
		}else {
			for(String p : sb.getPart()) {
				part += p + "/";
			}
		}
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getName());
			ps.setString(2, sb.getCompany());
			ps.setString(3, sb.getEmail());
			ps.setString(4, sb.getSatisfaction());
			ps.setString(5, part);
			ps.setString(6, sb.getHowto());
			ps.setInt(7, sb.getAgree());
			ps.setInt(8, sb.getNo());
			
			int cnt = ps.executeUpdate();
			System.out.println("update cnt : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
