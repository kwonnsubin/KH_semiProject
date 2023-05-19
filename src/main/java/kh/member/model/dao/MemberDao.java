package kh.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static kh.common.jdbc.JDBCTemplate.*;
import kh.member.model.vo.MemberVo;

public class MemberDao {
	
	// 회원가입
//	public int enroll(Connection conn, MemberVo vo) {
//		int result = -1;
//		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?)";
//		PreparedStatement pstmt = null;
//		System.out.println(vo);
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getNickname());
//			pstmt.setString(2, vo.getPwd());
//			pstmt.setString(3, vo.getPwdcheck());
//			pstmt.setString(4, vo.getEmail());
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//	}
	
	// 회원가입
	public int enroll(Connection conn, MemberVo vo) {
	    int isDuplicate = checkEmailDuplicate(conn, vo.getEmail());
	    
	    if (isDuplicate > 0) {
	        return -1; // 중복된 이메일인 경우 실패를 나타내는 값(-1) 반환
	    }
	    
	    int result = -1;
	    String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?)";
	    PreparedStatement pstmt = null;
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, vo.getNickname());
	        pstmt.setString(2, vo.getPwd());
	        pstmt.setString(3, vo.getPwdcheck());
	        pstmt.setString(4, vo.getEmail());
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    
	    return result;
	}

    
    public int checkEmailDuplicate(Connection conn, String email) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return count;
    }

	
	
	
	// 로그인
	public MemberVo login(Connection conn, MemberVo vo) {
		MemberVo result = null;
		String sql = "select NICKNAME, PWD, EMAIL from member where email=? and pwd=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPwd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new MemberVo();
				result.setNickname(rs.getString("nickname"));
				result.setEmail(rs.getString("email"));
				result.setPwd(rs.getString("pwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}


}
