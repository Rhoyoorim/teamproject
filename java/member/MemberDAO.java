package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import util.JDBCUtil;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne2="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_selectOne1="SELECT * FROM MEMBER WHERE MID=?";
	final String sql_check="SELECT * FROM MEMBER WHERE MID=?";	
	final String sql_checkNick="SELECT * FROM MEMBER WHERE MNICK=?";	
	final String sql_selectAll="SELECT * FROM MEMBER";
	final String sql_insert="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";
	final String sql_update="UPDATE MEMBER SET MPW=?,MNAME=?,MNICK=?,MEMAIL=?,MBIRTH=?,PHONE=? WHERE MID=?";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=?";
	final String sql_selectOne_ID="SELECT * FROM MEMBER WHERE MNICK=?";
	final String sql_selectOne_PW="SELECT * FROM MEMBER WHERE MID=?";
	public MemberVO selectOne(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			if(vo.getMpw()!=null) {
			pstmt=conn.prepareStatement(sql_selectOne2);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			}else if(vo.getMpw()==null) {
				pstmt=conn.prepareStatement(sql_selectOne1);
				pstmt.setString(1, vo.getMid());	
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				MemberVO data=new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMpw(rs.getString("MPW"));
				data.setMname(rs.getString("MNAME"));
				data.setMnick(rs.getString("MNICK"));
				data.setMemail(rs.getString("MEMAIL"));
				data.setMbirth(rs.getString("MBIRTH"));
				data.setPhone(rs.getString("PHONE"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	public int check(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			if(vo.getMid()!=null) {
			pstmt=conn.prepareStatement(sql_check);
			pstmt.setString(1, vo.getMid());
			}else if(vo.getMnick()!=null) {
				pstmt=conn.prepareStatement(sql_checkNick);
				pstmt.setString(1, vo.getMnick());
			}
			ResultSet rs=pstmt.executeQuery();
			MemberVO data=new MemberVO();
			if(rs.next()) {
				data.setMid(rs.getString("MID"));
			}
			if(data.getMid()!=null||data.getMnick()!=null) {
				return 1;
			}
			return 2;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return 0;
	}
	
	public ArrayList<MemberVO> selectAll(MemberVO vo) {
		ArrayList<MemberVO> datas=new ArrayList<MemberVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO data=new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMpw(rs.getString("MPW"));
				data.setMname(rs.getString("MNAME"));
				data.setMnick(rs.getString("MNICK"));
				data.setMemail(rs.getString("MEMAIL"));
				data.setMbirth(rs.getString("MBIRTH"));
				data.setPhone(rs.getString("PHONE"));
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
	public boolean insert(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getMnick());
			pstmt.setString(5, vo.getMemail());
			pstmt.setString(6, vo.getMbirth());
			pstmt.setString(7, vo.getPhone());			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean APIinsert(MemberVO vo) {
		Random r =new Random();
		int rand;
		String nick;
		
		while(true) {
			rand=r.nextInt(10000)+1;
			nick="Petkige"+rand;
			MemberVO vvo=new MemberVO();
			vvo.setMnick(nick);
			if(this.check(vvo)==2) {
				break;
			}
		}
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, r.nextInt(10000)+"");
			pstmt.setString(3, "이름없음");
			pstmt.setString(4, nick);
			pstmt.setString(5, vo.getMid());
			pstmt.setString(6, "미입력");
			pstmt.setString(7, "미입력");			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setString(1, vo.getMpw());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMnick());
			pstmt.setString(4, vo.getMemail());
			pstmt.setString(5, vo.getMbirth());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setString(1, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	// id 찾는 로직
		public MemberVO selectOne_id(MemberVO vo) {
			conn=JDBCUtil.connect();
			try {
				pstmt=conn.prepareStatement(sql_selectOne_ID);
				pstmt.setString(1, vo.getMnick());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					MemberVO data=new MemberVO();
					data.setMid(rs.getString("MID"));
					data.setMnick(rs.getString("MNICK"));
					data.setMpw(rs.getString("MPW"));
					return data;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				JDBCUtil.disconnect(pstmt, conn);
			}
			return null;
		}
		
		// 비밀번호 찾는 로직
		public MemberVO selectOne_pw(MemberVO vo) {
			conn=JDBCUtil.connect();
			try {
				pstmt=conn.prepareStatement(sql_selectOne_PW);
				pstmt.setString(1, vo.getMid());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					MemberVO data=new MemberVO();
					data.setMid(rs.getString("MID"));
					data.setMnick(rs.getString("MNICK"));
					data.setMpw(rs.getString("MPW"));
					return data;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				JDBCUtil.disconnect(pstmt, conn);
			}
			return null;
		}
}
