package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt;
//	final String sql_selectOne="SELECT * FROM REVIEW WHERE RID=? WHERE MID=?";
	final String sql_selectAll="SELECT R.RID,R.IID,R.MID,M.MNICK AS WRITER,R.CONTENT,R.STAR FROM REVIEW R INNER JOIN MEMBER M ON R.MID=M.MID WHERE IID=?";
	final String sql_insert="INSERT INTO REVIEW(IID,MID,WRITER,CONTENT,STAR,RIMG) VALUES(?,?,?,?,?,?)";
	final String sql_update="UPDATE REVIEW SET CONTENT=?,STAR=? WHERE RID=?";
	final String sql_delete="DELETE FROM REVIEW WHERE RID=?";
//	public ReviewVO selectOne(ReviewVO vo) {
//		conn=JDBCUtil.connect();
//		try {
//			pstmt=conn.prepareStatement(sql_selectOne);
//			pstmt.setInt(1, vo.getRid());
//			pstmt.setString(2, vo.getMid());
//			ResultSet rs=pstmt.executeQuery();
//			if(rs.next()) {
//				ReviewVO data=new ReviewVO();
//				data.setRid(rs.getInt("RID"));
//				data.setIid(rs.getInt("IID"));
//				data.setMid(rs.getString("MID"));
//				data.setTitle(rs.getString("TITLE"));
//				data.setWriter(rs.getString("WRITER"));
//				data.setContent(rs.getString("CONTENT"));
//				data.setStar(rs.getFloat("STAR"));
//				return data;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.disconnect(pstmt, conn);
//		}
//		return null;
//	}
	public ArrayList<ReviewVO> selectAll(ReviewVO vo) {
		ArrayList<ReviewVO> datas=new ArrayList<ReviewVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO data=new ReviewVO();
				data.setRid(rs.getInt("RID"));
				data.setIid(rs.getString("IID"));
				data.setMid(rs.getString("MID"));
				data.setWriter(rs.getString("WRITER"));
				data.setContent(rs.getString("CONTENT"));
				data.setStar(rs.getFloat("STAR"));
				data.setRimg(rs.getString("RIMG"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	public boolean insert(ReviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getIid());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getContent());
			pstmt.setFloat(5, vo.getStar());
			pstmt.setString(6, vo.getRimg());		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(ReviewVO vo) {
		conn=JDBCUtil.connect();
		try {  
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getContent());
			pstmt.setFloat(2, vo.getStar());
			pstmt.setInt(3, vo.getRid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(ReviewVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getRid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
}
