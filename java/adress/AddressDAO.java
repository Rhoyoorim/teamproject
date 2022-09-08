package adress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class AddressDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne="SELECT * FROM ADDRESS WHERE MID=?";
	final String sql_selectAll="SELECT * FROM ADDRESS WHERE MID=?";
	final String sql_insert="INSERT INTO ADDRESS(MID,ADDRESS,ANAME,APHONE,AFLAG) VALUES(?,?,?,?,?)";
	final String sql_update="UPDATE ADDRESS SET ADDRESS=?,ANAME=?,APHONE=? WHERE MID=?";
	final String sql_delete="DELETE FROM ADDRESS WHERE AID=?";
	public AddressVO selectOne(AddressVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getAid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				AddressVO data=new AddressVO();
				data.setMid(rs.getString("MID"));
				data.setAddress(rs.getString("ADDRESS"));
				data.setAname(rs.getString("ANAME"));
				data.setAphone(rs.getString("APHONE"));
				data.setAflag(rs.getString("AFLAG"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public ArrayList<AddressVO> selectAll(AddressVO vo) {
		ArrayList<AddressVO> datas=new ArrayList<AddressVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setString(1, vo.getMid());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				AddressVO data=new AddressVO();
				data.setMid(rs.getString("MID"));
				data.setAddress(rs.getString("ADDRESS"));
				data.setAname(rs.getString("ANAME"));
				data.setAphone(rs.getString("APHONE"));
				data.setAflag(rs.getString("AFLAG"));
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
	public boolean insert(AddressVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getAname());
			pstmt.setString(4, vo.getAphone());
			pstmt.setString(5, vo.getAflag());		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(AddressVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getAddress());
			pstmt.setString(2, vo.getAname());
			pstmt.setString(3, vo.getAphone());
			pstmt.setString(4, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(AddressVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getAid());
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
