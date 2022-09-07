package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_selectOne_ID="SELECT * FROM MEMBER1 WHERE MNICK=?";
	final String sql_selectOne_PW="SELECT * FROM MEMBER1 WHERE MID=?";
	final String sql_selectAll="SELECT * FROM (SELECT A.*,ROWNUM AS RNUM FROM (SELECT * FROM MEMBER ORDER BY ROWNUM DESC) A WHERE ROWNUM<=3) WHERE RNUM>=1";
	final String sql_insert="INSERT INTO MEMBER VALUES(?,?,?)";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=?"; // Member테이블에 mid에 해당하는 행 지워줘
	final String sql_deleteCheck1="SELECT * FROM BOARD WHERE MID = ?"; // Board 테이블에 mid에 해당하는 행이 있으면 보여줘
	final String sql_deleteCheck2="SELECT * FROM REPLY WHERE MID = ?";


	// 최근 가입한 회원 3명 뽑아내는 로직 =====================================
	public ArrayList<MemberVO> selectAll(MemberVO vo) {
		ArrayList<MemberVO> datas=new ArrayList<MemberVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO data=new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMnick(rs.getString("MNICK"));
				data.setMpw(rs.getString("MPW"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	// 현재 로그인한 회원의 정보를 확인하고 세팅하기 =============================
	public MemberVO selectOne(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
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
	
	// 회원가입하는 로직 ====================================================
	public boolean insert(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMnick());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	// 회원 삭제하는 로직===================================================
	public boolean delete(MemberVO vo) { // 회원 삭제 메서드
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_deleteCheck1);
			pstmt.setString(1, vo.getMid());
			ResultSet rs1 = pstmt.executeQuery(); // board테이블에 mid넣어서 데이터 있는지 확인
			
			pstmt=conn.prepareStatement(sql_deleteCheck2);
			pstmt.setString(1, vo.getMid());
			ResultSet rs2 = pstmt.executeQuery(); // Reply테이블에 mid넣어서 데이터 있는지 확인
			
			if(rs1.next() || rs2.next()) { // board테이블 or Reply 테이블에 데이터가 있을 경우
				return false; // 있으면 false로 회원탈퇴 기능 실패
				
			}else { // board테이블 or Reply테이블에 데이터가 없을 경우
				
				pstmt=conn.prepareStatement(sql_delete);
				pstmt.setString(1, vo.getMid());
				pstmt.executeUpdate(); // Member테이블에 mid에 해당하는 데이터 삭제
				
				return true; // true로 회원탈퇴 기능 성공
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	}

}
