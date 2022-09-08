package buylist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import item.ItemVO;
import util.JDBCUtil;


public class BuyListDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_count="SELECT COUNT(*) FROM BUYLIST WHERE MID=?";
	final String sql_selectOne="SELECT * FROM BUYLIST WHERE MID=?";
	final String sql_selectAll="SELECT I.* FROM BUYLIST B INNER JOIN ITEM I ON B.IID=I.IID INNER JOIN MEMBER M ON B.MID=M.MID WHERE B.MID=? ORDER BY BID DESC LIMIT ?,5";
	final String sql_insert="INSERT INTO BUYLIST(IID,MID) VALUES(?,?)";
	final String sql_delete="DELETE FROM BUYLIST WHERE BID=?";

	public int count(BuyListVO vo) {
		conn=JDBCUtil.connect();
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql_count);
			pstmt.setString(1,vo.getMid());
			ResultSet rs=pstmt.executeQuery();
			int index=0;
			if(rs.next()) {
				count=rs.getInt(++index);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return count;
	}
	public BuyListVO selectOne(BuyListVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getBid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				BuyListVO data=new BuyListVO();
				data.setBid(rs.getInt("BID"));
				data.setIid(rs.getString("IID"));
				data.setMid(rs.getString("MID"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public ArrayList<ItemVO> selectAll(BuyListVO vo) {
		ArrayList<ItemVO> datas=new ArrayList<ItemVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setString(1, vo.getMid());
			pstmt.setInt(2, vo.getStartnum());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ItemVO data=new ItemVO();
				data.setIid(rs.getString("IID"));
				data.setIname(rs.getString("INAME"));
				data.setIprice(rs.getString("IPRICE"));
				data.setIcategory(rs.getString("ICATEGORY"));
				data.setIimg(rs.getString("IIMG"));
				data.setIcnt(rs.getInt("ICNT"));
				data.setIdate(rs.getString("IDATE"));
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
	public boolean insert(BuyListVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getIid());
			pstmt.setString(2, vo.getMid());		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(BuyListVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getBid());
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
