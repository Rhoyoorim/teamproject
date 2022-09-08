package pet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class PetDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne="SELECT * FROM PET WHERE PID=?";
	final String sql_selectAll="SELECT * FROM PET WHERE MID=?";
	final String sql_insert="INSERT INTO PET(PNAME,PVARITY,PAGE,PWEIGHT,PBIRTH,MID) VALUES(?,?,?,?,?,?)";
	final String sql_update="UPDATE PET SET PNAME=?,PVARITY=?,PAGE=?,PWEIGHT=?,PBIRTH=? WHERE PID=?";
	final String sql_delete="DELETE FROM PET WHERE PID=?";
	public PetVO selectOne(PetVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getPid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				PetVO data=new PetVO();
				data.setMid(rs.getString("MID"));
				data.setPid(rs.getInt("PID"));
				data.setPname(rs.getString("PNAME"));
				data.setPvarity(rs.getString("PVARITY"));
				data.setPage(rs.getString("PAGE"));
				data.setPweight(rs.getString("PWEIGHT"));
				data.setPbirth(rs.getString("PBIRTH"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public ArrayList<PetVO> selectAll(PetVO vo) {
		ArrayList<PetVO> datas=new ArrayList<PetVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setString(1, vo.getMid());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				PetVO data=new PetVO();
				data.setMid(rs.getString("MID"));
				data.setPid(rs.getInt("PID"));
				data.setPname(rs.getString("PNAME"));
				data.setPvarity(rs.getString("PVARITY"));
				data.setPage(rs.getString("PAGE"));
				data.setPweight(rs.getString("PWEIGHT"));
				data.setPbirth(rs.getString("PBIRTH"));
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
	public boolean insert(PetVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getPname());
			pstmt.setString(2, vo.getPvarity());
			pstmt.setString(3, vo.getPage());
			pstmt.setString(4, vo.getPweight());
			pstmt.setString(5, vo.getPbirth());		
			pstmt.setString(6, vo.getMid());		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean update(PetVO vo) {
		conn=JDBCUtil.connect();
		try { 
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getPname());
			pstmt.setString(2, vo.getPvarity());
			pstmt.setString(3, vo.getPage());
			pstmt.setString(4, vo.getPweight());
			pstmt.setString(5, vo.getPbirth());	
			pstmt.setInt(6, vo.getPid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(PetVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getPid());
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
