package item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.MemberVO;
import review.ReviewVO;
import util.JDBCUtil;
import util.JDBCUtil2;


public class ItemDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_insert="INSERT INTO ITEM VALUES(?,?,?,?,?,?,now())";
	final String sql_selectAll_S="SELECT * FROM ITEM WHERE LOCATE(?,IID) LIMIT 0,20;"; // 검색
	final String sql_selectAll_ID="SELECT * FROM ITEM WHERE LOCATE(?,IID)";
	final String sql_selectAll_R="SELECT R.RID,R.IID,R.MID,M.MNICK AS WRITER,R.CONTENT,R.STAR,R.RIMG FROM REVIEW R INNER JOIN MEMBER M ON R.MID=M.MID WHERE IID=?";
	final String sql_selectAll_N="SELECT * FROM ITEM ORDER BY IDATE DESC LIMIT 0,10";
	final String sql_selectAll_M="SELECT * FROM ITEM WHERE IID LIKE CONCAT(?,'%') LIMIT 0,?";
	final String sql_selectOne="SELECT * FROM ITEM WHERE IID=?";
	final String sql_delete="DELETE FROM ITEM WHERE IID=?";
	final String sql_update="UPDATE ITEM SET INAME=?,IPRICE=?,ICATEGORY=?,ICNT=? WHERE IID=?";
	final String sql_selectOne2="SELECT * FROM ITEM WHERE IID=?";
	final String sql_selectAll_Search="SELECT * FROM ITEM WHERE LOCATE(?,CONCAT(ICATEGORY,INAME)) LIMIT 0,?";
	// 상품 추가

	public boolean insert(ItemVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getIid());
			pstmt.setString(2, vo.getIimg());
			pstmt.setString(3, vo.getIname());
			pstmt.setString(4, vo.getIprice());
			pstmt.setString(5, vo.getIcategory());
			pstmt.setInt(6, vo.getIcnt());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	// 상품 검색

	public ArrayList<ItemVO> selectAll(ItemVO vo) {
		ArrayList<ItemVO> datas = new ArrayList<ItemVO>();
		conn = JDBCUtil.connect();
		ResultSet rs;

		try {
			if(vo.getIname()!=null) {
				pstmt = conn.prepareStatement(sql_selectAll_S);
				pstmt.setString(1, vo.getIname());
			}else if (vo.getIid()!=null) {
				pstmt = conn.prepareStatement(sql_selectAll_M);
				pstmt.setString(1, vo.getIid());
				pstmt.setInt(2, vo.getMore());
			}else if(vo.getIdate()!=null) {
				pstmt = conn.prepareStatement(sql_selectAll_N);
			}else if(vo.getIcategory()!=null) {
				System.out.println("로그: DAO search 들어옴");
				pstmt = conn.prepareStatement(sql_selectAll_Search);
				pstmt.setString(1,vo.getIcategory());
				pstmt.setInt(2, vo.getMore());
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {					
				ItemVO data = new ItemVO();
				data.setIid(rs.getString("IID"));
				data.setIimg(rs.getString("IIMG"));
				data.setIname(rs.getString("INAME"));
				data.setIprice(rs.getString("IPRICE"));
				data.setIcategory(rs.getString("ICATEGORY"));
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


	//	// 상품 검색
	//	
	//	public ItemVO selectOne(ItemVO vo) {
	//		conn=JDBCUtil.connect(); 
	//		ResultSet rs=null; 
	//		try {
	//			pstmt=conn.prepareStatement(sql_selectOne);
	//			pstmt.setInt(1, vo.getIid()); 
	//			rs=pstmt.executeQuery(); 
	//			if(rs.next()) { 
	//				ItemVO data=new ItemVO();
	//				
	//				data.setIid(rs.getString("IID"));
	//				data.setIimg(rs.getString("IIMG"));
	//				data.setIname(rs.getString("INAME"));
	//				data.setIprice(rs.getString("IPRICE"));
	//				data.setIcategory(rs.getString("ICATEGORY"));
	//				return data; 
	//			}
	//			else {
	//				return null; 
	//			}
	//		} catch (SQLException e) {
	//			// TODO Auto-generated catch block
	//			e.printStackTrace();
	//			return null;
	//		} finally {
	//			try {
	//				rs.close();
	//			} catch (SQLException e) {
	//				// TODO Auto-generated catch block
	//				e.printStackTrace();
	//			}
	//			JDBCUtil.disconnect(pstmt, conn);
	//		}		
	//	}

	// 상품 삭제

	public boolean delete(ItemVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setString(1, vo.getIid()); 
			int res=pstmt.executeUpdate(); 
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	// 상품 갱신

	public boolean update(ItemVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getIname());
			pstmt.setString(2, vo.getIprice());
			pstmt.setString(3, vo.getIcategory());
			pstmt.setInt(4, vo.getIcnt());
			pstmt.setString(5, vo.getIid());
			int res=pstmt.executeUpdate(); // 데이터의 자동적인 변화
			if(res==0) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public ItemSetVO selectOne(ItemVO ivo){ // 유지보수 용이

		ItemSetVO is=new ItemSetVO();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, ivo.getIid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {

				ItemVO itemVO=new ItemVO();
				itemVO.setIid(rs.getString("IID"));
				itemVO.setIimg(rs.getString("IIMG"));
				itemVO.setIname(rs.getString("INAME"));
				itemVO.setIprice(rs.getString("IPRICE"));
				itemVO.setIcategory(rs.getString("ICATEGORY"));
				itemVO.setIcnt(rs.getInt("ICNT"));
				itemVO.setIdate(rs.getString("IDATE"));
				is.setItemVO(itemVO);

				
				ArrayList<ReviewVO> rList=new ArrayList<ReviewVO>();
				pstmt=conn.prepareStatement(sql_selectAll_R);
				pstmt.setString(1, rs.getString("IID"));
				ResultSet rs2=pstmt.executeQuery();
				while(rs2.next()) {
					ReviewVO reviewVO=new ReviewVO();

					reviewVO.setRid(rs2.getInt("RID"));
					reviewVO.setIid(rs2.getString("IID"));
					reviewVO.setMid(rs2.getString("MID"));
					reviewVO.setWriter(rs2.getString("WRITER"));
					reviewVO.setContent(rs2.getString("CONTENT"));
					reviewVO.setStar(rs2.getFloat("STAR"));
					reviewVO.setRimg(rs2.getString("RIMG"));

					rList.add(reviewVO);
				}
				is.setrList(rList);				

			}
			else {
				return null; // 그게 아니라면 null값 돌려주기
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return is;
	}
	
	public ItemVO selectOne2(ItemVO vo) {
		ItemVO itemVO=new ItemVO();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne2);
			pstmt.setString(1, vo.getIid());	
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				itemVO.setIid(rs.getString("IID"));
				itemVO.setIimg(rs.getString("IIMG"));
				itemVO.setIname(rs.getString("INAME"));
				itemVO.setIprice(rs.getString("IPRICE"));
				itemVO.setIcategory(rs.getString("ICATEGORY"));
				itemVO.setIcnt(rs.getInt("ICNT"));
				itemVO.setIdate(rs.getString("IDATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return itemVO;
	}
}


