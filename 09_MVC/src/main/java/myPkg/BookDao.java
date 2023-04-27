package myPkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// jar화일이 있어야 naming 패키지에 있는 것들 사용가능함!!!@@!@@@!#!@
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDao {
	
	private static BookDao bdao; // null // static 메서드안에서는 static 변수만 사용가능해서
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static BookDao getInstance() { // 클래스명으로 호출할 수 있도록 static 사용.
		if(bdao == null) {
			bdao = new BookDao();
		}
		return bdao;
	}
	
	private BookDao(){
		// DBCP 사용해서 접속하기
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			
			System.out.println("접속성공");
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertBook(BookBean bb) {
		String sql = "insert into book values(bseq.nextval, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setInt(3, bb.getPrice());
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

	public ArrayList<BookBean> getAllbook() {
		ArrayList<BookBean> list = new ArrayList<BookBean> ();
		String sql = "select * from book order by no";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookBean bb = new BookBean();
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPrice(rs.getInt("price"));
				list.add(bb);
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

	public void deleteBook(String no) {
		String sql = "delete book where no=" + no;
		try {
			ps = conn.prepareStatement(sql);
			int cnt = ps.executeUpdate();
			System.out.println("delete cnt : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public BookBean getOneBook(String no) {
		BookBean bb = new BookBean();
		String sql = "select * from book where no=" + no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}

	public void updateBook(BookBean bb) {
		String sql = "update book set title=?, author=?, price=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setInt(3, bb.getPrice());
			ps.setInt(4, bb.getNo());
			int cnt = ps.executeUpdate();
			System.out.println("update cnt : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
